class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  # トークンを発行し、ユーザーにパスワードリセット用のリンク付きメールを送信するアクション
  def create
    # 記入したemailからユーザーを探す。
    @user = User.find_by(email: params[:email])
    # ユーザーのemailにインストラクションを送るコード
    # deliver_reset_password_instruction!→有効期限付きのリセットコードを作成し、ユーザーにメールを送信するメソッド。
    @user.deliver_reset_password_instructions! if @user
    redirect_to login_path
    flash[:success]= 'パスワードリセットのメールを送信しました'
  end

  # 新しいパスワードを入力する画面に移動するときに働くアクション
  def edit
    @token = params[:id]
    # load_from_reset_password_token→モデルからトークンを探し、トークンが見つかり且つ有効であればユーザーを返す。
    @user = User.load_from_reset_password_token(params[:id])
    if @user.blank?
      not_authenticated
      return
    end
  end

  # パスワードをリセットし、再登録を実行するアクション
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    # password_confirmation属性の有効性を確認
    @user.password_confirmation = params[:user][:password_confirmation]
    # トークンをクリアして、ユーザーの新しいパスワードを更新しようとする。
    if @user.change_password(params[:user][:password])
      redirect_to login_path
      flash[:success]= 'パスワードがリセットされました'
    else
      flash[:danger] = 'パスワードの変更に失敗しました。'
      render :action => "edit"
    end
  end
end
