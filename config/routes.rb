Rails.application.routes.draw do

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
  }

  # 顧客用
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/search" => "homes#search"
    get "/search_tag" => "posts#search_tag"
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :index, :update, :destroy]
  end
  
  # 管理者用
  namespace :admin do
    root to: "homes#top"
    get "/search" => "homes#search"
    resources :posts, only: [:index, :show, :update, :destroy]
    resources :users, only: [:index, :show]
    resources :categories, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
