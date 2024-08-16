class RoomsController < ApplicationController
  def index
  end

  def floor_simulator
  end

  def wallpaper_simulator
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:color, :image)
  end
end
