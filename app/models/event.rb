class Event < ActiveRecord::Base
  attr_accessible :name, :description,:photos_attributes,:photos,:photo_file_name
  
  has_attached_file :photo
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  belongs_to :user
end
