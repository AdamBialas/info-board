class CreateInfoComments < ActiveRecord::Migration[6.1]
  def change
    create_table :info_comments do |t|
      t.text :text_
      t.references :commentable, polymorphic: true
      t.references :User, null: false , foreign_key: true
      t.integer :parent_id
      t.timestamps
    end
  end
end
