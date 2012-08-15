class CreateIncomings < ActiveRecord::Migration
  def change
    create_table :incomings do |t|
      t.integer :from_id

      t.timestamps
    end
  end
end
