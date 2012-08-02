class AddAttachmentToPhotos < ActiveRecord::Migration
  def change
  add_column :photos, :photo_file_name, :string
  end
end
