class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  before_action :require_login

  # private
  # ユーザーが認証されていない場合に、ログインページにリダイレクトするためのコードです。つまり、ユーザーがログインしていない場合には、このメソッドが呼び出され、自動的にログインページにリダイレクトされます
  # def not_authenticated
  #   redirect_to login_path
  # end
end
