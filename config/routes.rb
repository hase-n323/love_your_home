Rails.application.routes.draw do
  root 'home#index'  # HomeControllerのindexアクションにルートを指定する例

  get 'rooms/floor_simulator', to: 'rooms#floor_simulator', as: 'floor_simulator'
  get 'rooms/wallpaper_simulator', to: 'rooms#wallpaper_simulator', as: 'wallpaper_simulator'

  resources :rooms, only: [:index, :create]
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new' #ログイン画面を表示するためのルーティング
  post 'login', to: 'user_sessions#create' #ログイン処理を行うためのルーティング
end
