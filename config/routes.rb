Rails.application.routes.draw do

  root 'rooms#top'
  get 'floor_simulator', to: 'rooms#floor_simulator'
  get 'wallpaper_simulator', to: 'rooms#wallpaper_simulator'
  resources :users, only: %i[new create]
end