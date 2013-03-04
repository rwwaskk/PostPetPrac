class CreateLikes < ActiveRecord::Migration
def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.integer :photo_id
      t.integer :album_id

      t.timestamps
    end
      add_index :likes, [:micropost_id, :user_id], :unique => true
      add_index :likes, [:photo_id, :user_id], :unique => true
      add_index :likes, [:album_id, :user_id], :unique => true

  end
end
