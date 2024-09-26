class SimulatorsController < ApplicationController
  def index
    @simulator = Simulator.find(params[:id])
    current_user.bookmarks.create(shop: @shop)
    redirect_to @simulator
  end
end
