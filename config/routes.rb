Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  #管理者側のルーティング
  namespace :admin do
    resources :training, only: [:new, :create, :index, :show, :edit, :update]
  end

  #ユーザ側のルーティング
  root to: "user/homes#top"
  get "about" => "user/homes#about", as: "about"
  namespace :user do
    resources :training, only: [:index, :show]
  end

end
