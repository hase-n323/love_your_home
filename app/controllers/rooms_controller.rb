class RoomsController < ApplicationController
  # 未ログインのユーザーでもアクセスできるページ
  skip_before_action :require_login, only: %i[top simulator]

  def simulator
    @bookmarks = current_user.bookmarks.pluck(:product_number) if logged_in?
  end
end
  
