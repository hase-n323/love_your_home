class UserSessionsController < ApplicationController
  # require_loginフィルターを new と create アクションに適用しないように指示
  # 新しいユーザーを作成するための new アクションと create アクションでは、ログインが必要ないことを示す
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      # ログインに成功した場合、root_path(トップページ)にリダイレクト
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[danger] = 'ログインに失敗しました'
      # ログインに失敗した場合、ログインページにリダイレクト
      # status: :unprocessable_entity HTTPステータスコード422エラーを返す
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # logoutメソッドを呼び出して、セッションをクリアする
    logout
    # ログアウトに成功した場合、root_path(トップページ)にリダイレクト
    # 「status: :see_other」とは、destoryアクションでTurboを使うために必要なコード
    # status: :see_otherを指定すると、POSTリクエスト後の新しいページへのGETリクエスト移動が促され、フォームの再送信を防ぐ
    redirect_to root_path, status: :see_other, success: 'ログアウトしました'
  end
end
