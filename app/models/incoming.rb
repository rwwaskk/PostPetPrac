class Incoming < ActiveRecord::Base
  attr_accessible :from_id,:title,:content,:user_id,:unread
  belongs_to :user
end
