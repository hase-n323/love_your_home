class SorceryCore < ActiveRecord::Migration[7.2]
  def change
    create_table_if_not_exists :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end
  end
end
