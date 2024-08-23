class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to rooms_path, success: "ユーザー登録が完了しました"
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new, status: :unprocessable_entity
      # status: :unprocessable_entity と指定することで、HTTPステータスコード422が返され、クライアントにリクエストの処理ができなかったことを適切に伝える
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
