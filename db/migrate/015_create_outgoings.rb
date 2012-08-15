class CreateOutgoings < ActiveRecord::Migration
  def change
    create_table :outgoings do |t|
      t.integer :to_id
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :outgoings,[:user_id,:created_at]
  end
end
