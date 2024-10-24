Rails.application.routes.draw do
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"

  root 'rooms#top'
  get 'simulator', to: 'rooms#simulator'
  resources :users, only: %i[new create]
  # ログインフォームを表示するためのGETリクエスト
  get 'login', to: 'user_sessions#new'
  # ログインフォームから送信された情報を処理するPOSTリクエスト
  post 'login', to: 'user_sessions#create'
  # DELETEメソッドを利用し、logoutパスへのリクエストがあった場合にuser_sessionsコントローラーのdestroyアクションを呼び出す
  delete 'logout', to: 'user_sessions#destroy'

  resources :bookmarks, only: [:index, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
