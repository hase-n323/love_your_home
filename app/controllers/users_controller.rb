class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to rooms_path
    else
      flash.now[:notice] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
