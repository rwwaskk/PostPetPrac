class AddPhotoIdToComments < ActiveRecord::Migration
  def change
    add_column :microcomments, :photo_id, :integer
  end
end
