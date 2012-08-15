class AddTitleToIncomings < ActiveRecord::Migration
  def change
  add_column :incomings,:title,:string
  end
end
