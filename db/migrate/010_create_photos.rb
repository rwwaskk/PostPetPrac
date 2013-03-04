class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.integer :album_id
      t.integer :event_id
      t.integer :user_id
      

      t.timestamps
    end
     add_index :photos,[:album_id,:created_at]
     add_index :photos,[:event_id,:created_at]
     add_index :photos,[:user_id,:created_at]
  end
end
