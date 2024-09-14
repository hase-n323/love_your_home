class UsersController < ApplicationController
  # 未ログインのユーザーでもアクセスできるページ
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #login_path ヘルパーメソッドで、保存が成功したらログインページへ飛ばす
      redirect_to root_path, success: 'ユーザー登録が完了しました'
    else
      #保存が失敗したら登録画面へ飛ばす
      flash.now[:alert] = 'ユーザー登録に失敗しました'
      # status: :unprocessable_entity HTTPステータスコード422エラーを返す
      render :new, status: :unprocessable_entity
    end
  end

  private
  #ユーザー登録画面からUserモデルへ送信されたパラメーターを要求し、その中からpermitで指定したパラメータを取得
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
