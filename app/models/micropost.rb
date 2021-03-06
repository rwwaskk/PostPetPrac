class Micropost < ActiveRecord::Base
  has_attached_file :photo
  attr_accessible :content, :user_id,:photo
  has_many :microcomments
  belongs_to :user
  has_many :users_like_micropost, :through=> :likes,:foreign_key => :user_id,:source => :user
  has_many :likes
  
  scope :desc, order("microposts.created_at DESC")
  
  
  
  
  def self.from_users_followed_by(user)
  followed_user_ids = "SELECT followed_id FROM relationships 
  					  WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",:user_id => user.id)
  end
end
