class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  before_save :set_votes_to_zero

  def set_votes_to_zero
    self.votes ||= 0
  end


end
