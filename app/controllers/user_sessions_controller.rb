class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:notice] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
      # status: :unprocessable_entity と指定することで、HTTPステータスコード422が返され、クライアントにリクエストの処理ができなかったことを適切に伝える
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
