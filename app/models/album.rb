class Album < ActiveRecord::Base
  attr_accessible :name, :user_id,:photos,:photo_file_name,:photos_attributes,:photo_file_name
  
  has_attached_file :photo
  belongs_to :user
  has_many :photos,:dependent=>:destroy
 
  accepts_nested_attributes_for :photos, :allow_destroy => true
  def photo_file_name
  end
end
