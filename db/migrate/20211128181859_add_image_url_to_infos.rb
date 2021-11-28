class AddImageUrlToInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :infos, :image_url, :string
  end
end
