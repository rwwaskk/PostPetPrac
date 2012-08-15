class AddContentToIncomings < ActiveRecord::Migration
  def change
  add_column :incomings,:content,:string
  end
end
