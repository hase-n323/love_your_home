Rails.application.routes.draw do

  root 'rooms#top'
  get 'simulator', to: 'rooms#simulator'
  resources :users, only: %i[new create]
  # ログインフォームを表示するためのGETリクエスト
  get 'login', to: 'user_sessions#new'
  # ログインフォームから送信された情報を処理するPOSTリクエスト
  post 'login', to: 'user_sessions#create'
  # DELETEメソッドを利用し、logoutパスへのリクエストがあった場合にuser_sessionsコントローラーのdestroyアクションを呼び出す
  delete 'logout', to: 'user_sessions#destroy'

  resources :bookmarks, only: [:create] # 必要に応じて他のアクションも追加可能
end
