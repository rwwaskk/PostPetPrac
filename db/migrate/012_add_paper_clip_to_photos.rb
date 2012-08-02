class AddPaperClipToPhotos < ActiveRecord::Migration
  def self.up
  add_column :photos,:image_file_name,:string
  add_column :photos,:image_content_type,:string
  add_column :photos,:image_file_size, :integer
  add_column :photos,:image_uploaded_at, :datetime
  end
  
  def self.down
  remove_column :photos,:image_file_name,:string
  remove_column :photos,:image_content_type,:string
  remove_column :photos,:image_file_size, :integer
  remove_column :photos,:image_uploaded_at, :datetime
  end
  
  
end
