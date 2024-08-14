# frozen_string_literal: true

Rails.application.routes.draw do
  root 'rooms#index'
  get 'rooms/floor_simulator', to: 'rooms#floor_simulator', as: 'floor_simulator'
  get 'rooms/wallpaper_simulator', to: 'rooms#wallpaper_simulator', as: 'wallpaper_simulator'

  resources :rooms, only: %i[index create]
end
