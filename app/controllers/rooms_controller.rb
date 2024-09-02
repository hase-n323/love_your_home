class RoomsController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  
  def top; end

  def floor_simulator; end

  def wallpaper_simulator; end
end
