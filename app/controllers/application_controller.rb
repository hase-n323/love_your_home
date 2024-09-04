class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern　#最新のブラウザに対してのみアクセスを許可する設定
  before_action :require_login
  # フラッシュメッセージのタイプを追加するメソッド.デフォルトでは、notice と alert の二種類のキーしか用意されていない
  add_flash_types :success, :danger

  private

  def not_authenticated
    redirect_to login_path
  end
end
