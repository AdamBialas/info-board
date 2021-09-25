class AddUserIdToInfos < ActiveRecord::Migration[6.1]
  def change
    add_reference :infos, :user, index: true
  end
end
