class AddPhotosToMicroposts < ActiveRecord::Migration
  def change
  add_column :microposts, :photo_file_name, :string
  end
end
