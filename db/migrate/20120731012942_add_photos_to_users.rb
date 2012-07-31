class AddPhotosToUsers < ActiveRecord::Migration
  def change
   add_column :users, :photo_file_name, :string
  end
end
