Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "users/registrations",
  passwords: "users/passwords",
  sessions: 'users/sessions'
}

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  #管理者側のルーティング
  namespace :admin do
    resources :trainings, only: [:new, :create, :index, :show, :edit, :update]
  end

  #ユーザ側のルーティング
  root to: "users/homes#top"
  get "about" => "users/homes#about", as: "about"
  get "users/:id/unsubscribe" => "users/users#unsubscribe", as: "unsubscribe"
  patch "users/:id/withdraw" => "users/users#withdraw", as: "withdraw"
  scope module: :users do
    resources :users, only: [:show, :edit, :update]
    resources :trainings, only: [:index, :show]
    resources :posts, only:[:new, :index, :show, :edit, :update, :delete]
  end

end
