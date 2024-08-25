class AddSorceryCoreToUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt #パスワードのハッシュ化に使用される「ソルト」と呼ばれるランダムな文字列を保存するカラム
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nickname # Add nickname column
      t.timestamps null: false #timestampsメソッドは、created_atとupdated_atの2つのカラムを自動的に作成する
    end
  end
end