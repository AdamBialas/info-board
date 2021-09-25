class AddNameIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, limit:32
  end
end
