class Micropost < ActiveRecord::Base

  attr_accessible :content, :user_id
  has_many :microcomments
  belongs_to :user
  validates :user_id, :presence => true
  validates :content, :presence=> true
  
end
