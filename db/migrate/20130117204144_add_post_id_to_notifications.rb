class AddPostIdToNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :micropost_id,:integer
  end
end
