class AddLastNameIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :lastname, :string, limit:64
  end
end
