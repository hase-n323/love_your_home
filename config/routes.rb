Rails.application.routes.draw do

  root 'rooms#top'

  get 'floor_simulator', to: 'rooms#floor_simulator'
  get 'wallpaper_simulator', to: 'rooms#wallpaper_simulator'

end
