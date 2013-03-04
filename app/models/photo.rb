require 'paperclip'

class Photo < ActiveRecord::Base
  attr_accessible :description, :album_id,:event_id,:user_id,:image,:image_file_name,:images_attributes
 
  has_attached_file :image,
  :styles=>{
  :thumb=>'150x150#',
  :medium=>'300x300>',
  :large=>'600x600>'
  }
  belongs_to :album
  belongs_to :event
  belongs_to :user
  
  has_many :microcomments
  has_many :likes
  
  
end
