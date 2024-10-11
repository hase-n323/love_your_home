class AddProductImageUrlToBookmarks < ActiveRecord::Migration[7.2]
  def change
    add_column :bookmarks, :product_image_url, :string
  end
end
