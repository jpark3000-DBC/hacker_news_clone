class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  before_save :set_votes_to_zero

  def set_votes_to_zero
    self.votes ||= 0
  end

end
