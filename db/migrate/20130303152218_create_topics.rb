class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :content
      t.integer :last_post_id
      t.datetime :last_post_at

      t.timestamps
    end
  end
end
