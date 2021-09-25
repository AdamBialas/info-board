class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.text :contents

      t.timestamps
    end
  end
end
