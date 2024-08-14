# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms, if_not_exists: true do |t|
      t.string :color
      t.string :image

      t.timestamps
    end
  end
end
