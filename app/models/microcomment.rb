class Microcomment < ActiveRecord::Base
  attr_accessible :content, :micropost_id,:user_id,:photo_id
  belongs_to :micropost
  belongs_to :user
  belongs_to :photo
 

 
  
  
  
end
