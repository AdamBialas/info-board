class AddPhotoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photo, :attachment
  end
end
