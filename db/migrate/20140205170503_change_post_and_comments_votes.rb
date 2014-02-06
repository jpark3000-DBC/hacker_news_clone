class ChangePostAndCommentsVotes < ActiveRecord::Migration
  def change
    add_column :posts, :votes, :integer
    add_column :comments, :votes, :integer
  end
end
