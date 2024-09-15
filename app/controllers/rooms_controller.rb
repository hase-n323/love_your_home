class RoomsController < ApplicationController
  # 未ログインのユーザーでもアクセスできるページ
  skip_before_action :require_login, only: %i[top simulator]
  
  def top; end

  def simulator; end

end
