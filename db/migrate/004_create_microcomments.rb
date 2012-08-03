class CreateMicrocomments < ActiveRecord::Migration
  def change
    create_table :microcomments do |t|
      t.string :content
      t.integer :micropost_id
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
    add_index :microcomments,[:user_id,:created_at]
  end
end
