class Notification < ActiveRecord::Base
  attr_accessible :content, :recipient_id
  validates_presence_of :recipient_id
  belongs_to :recipient, :foreign_key => :recipient_id, :class_name => 'User'
end



