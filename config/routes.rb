Rails.application.routes.draw do

  namespace :users do
    get 'menus/index'
    get 'menus/show'
  end
  devise_for :users, controllers: {
  registrations: "users/registrations",
  passwords: "users/passwords",
  sessions: 'users/sessions'
}

  devise_for :admin, controllers: {
  registrations: "users/registrations",
  passwords: "users/passwords",
  sessions: "admin/sessions"
}

  #管理者側のルーティング
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :menus, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  #ユーザ側のルーティング
  root to: "users/homes#top"
  get "about" => "users/homes#about", as: "about"
  get "users/:id/unsubscribe" => "users/users#unsubscribe", as: "unsubscribe"
  patch "users/:id/withdraw" => "users/users#withdraw", as: "withdraw"
  get "users/likes" => "users/users#likes", as: "likes"
  scope module: :users do
    resources :users, only: [:show, :edit, :update]
    resources :menus, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end

end
