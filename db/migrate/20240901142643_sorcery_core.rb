class SorceryCore < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      # crypted_とsaltはパスワードをハッシュ化するためのもの
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end
    # usersテーブルのemailカラムに一意なインデックスを追加するためのコード。
    # これにより、検索性能が向上し、emailの重複を防ぐことができる
    # add_index :users, :email, unique: true
  end
end
