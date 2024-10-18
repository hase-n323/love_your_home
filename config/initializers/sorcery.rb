Rails.application.config.sorcery.configure do |config|
  # サブモジュールに `reset_password` が含まれていることを確認
  config.submodules = [:reset_password]

  config.user_config do |user|
    # パスワードリセットメールの設定
    user.reset_password_mailer = UserMailer  
  end

  # 認証に使うモデルを指定
  config.user_class = "User"
end
