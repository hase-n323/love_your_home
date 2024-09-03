class RoomsController < ApplicationController
  # 未ログインのユーザーでもアクセスできるページ
  def wallpaper_simulator; end
  skip_before_action :require_login, only: %i[top floor_simulator wallpaper_simulator]
  
  def top; end

  def floor_simulator; end

  def wallpaper_simulator; end
end
