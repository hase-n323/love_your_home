class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :product_number
      t.string :product_link
      t.string :product_image

      t.timestamps
    end
  end
end
