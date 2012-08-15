class AddTitleToOutgoings < ActiveRecord::Migration
  def change
  add_column :outgoings,:title,:string
  end
end
