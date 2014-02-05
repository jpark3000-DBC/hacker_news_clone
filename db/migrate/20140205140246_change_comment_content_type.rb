class ChangeCommentContentType < ActiveRecord::Migration
  def up
    change_column(:comments, :content, :text)
    remove_column(:users, :salt)
  end

  def down
    change_column(:comments, :content, :string)
    add_column(:users, :salt)
  end
end
