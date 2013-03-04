class Topic < ActiveRecord::Base
  attr_accessible :last_post_at, :last_post_id, :name,:posts,:post,:content,:forum_id
  belongs_to :forum
  has_many :posts,:dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :posts, :allow_destroy => true
  
  scope :desc, order("topics.created_at DESC")
end
