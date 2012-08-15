class AddContentToOutgoings < ActiveRecord::Migration
  def change
   add_column :outgoings,:content,:text
  end
end
