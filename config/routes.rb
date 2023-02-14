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
  # get "users/my_page/:id/edit" => "user/user#edit", as: "edit_user"
  # patch 'users/my_page/:id/update', to: 'user/user#update'
  scope module: :user do
    resources :user, only: [:show, :edit, :update]
    resources :trainings, only: [:index, :show]
    resources :posts, only:[:new, :index, :show, :edit, :update, :delete]
  end

end
