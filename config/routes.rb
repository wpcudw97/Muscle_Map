Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "user/registrations",
  passwords: "user/passwords",
  sessions: 'user/sessions'
}

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  #管理者側のルーティング
  namespace :admin do
    resources :trainings, only: [:new, :create, :index, :show, :edit, :update]
  end

  #ユーザ側のルーティング
  root to: "user/homes#top"
  get "about" => "user/homes#about", as: "about"
  get "users/my_page/:id" => "user/user#show", as: "user"
  get "information/edit" => "user/user#edit", as: "edit_user"
  patch "users/information" => "user/user#update"
  namespace :user do
    resources :trainings, only: [:index, :show]
    resources :posts, only:[:new, :index, :show, :edit, :update, :delete]
  end

end
