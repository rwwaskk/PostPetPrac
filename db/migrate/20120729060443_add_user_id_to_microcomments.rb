class AddUserIdToMicrocomments < ActiveRecord::Migration
  def change
    add_column :microcomments, :user_id, :integer
  end
end
