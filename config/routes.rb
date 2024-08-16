Rails.application.routes.draw do
  root 'home#index'  # HomeControllerのindexアクションにルートを指定する例

  get 'rooms/floor_simulator', to: 'rooms#floor_simulator', as: 'floor_simulator'
  get 'rooms/wallpaper_simulator', to: 'rooms#wallpaper_simulator', as: 'wallpaper_simulator'

  resources :rooms, only: [:index, :create]
end
