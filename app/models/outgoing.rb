class Outgoing < ActiveRecord::Base
  attr_accessible :content, :title,:user_id,:to_id
  belongs_to :user
  validates :user_id, :presence => true
  validates :content, :presence=> true
end
