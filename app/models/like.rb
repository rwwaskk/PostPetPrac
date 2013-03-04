class Like < ActiveRecord::Base
  attr_accessible :user_id, :micropost_id,:photo_id,:album_id
  belongs_to :user
  belongs_to :micropost
  belongs_to :photo
  #has_many :liked_microposts, :through => :likes, :source => :user
 end
