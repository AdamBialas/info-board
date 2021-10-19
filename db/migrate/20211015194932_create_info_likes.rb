class CreateInfoLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :info_likes do |t|
      t.integer :info_id
      t.integer :user_id
      t.timestamps
    end
    add_index :info_likes, [:info_id,:user_id], unique: true
  end
end
