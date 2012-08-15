class AddUnreadToIncomings < ActiveRecord::Migration
  def change
  add_column :incomings,:unread,:boolean
  end
end
