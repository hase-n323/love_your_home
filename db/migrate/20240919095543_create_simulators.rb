class CreateSimulators < ActiveRecord::Migration[7.2]
  def change
    create_table :simulators do |t|
      t.string :product_number
      t.string :product_link
      t.string :product_image
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
