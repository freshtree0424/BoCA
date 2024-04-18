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
    get "/analysis/top" => "analyses#top"
    get "/analyses/:id" => "analyses#show", as: "analysis"
    get "/analyses/detail/:id" => "analyses#detail", as: "analysis_detail"
    post "/guest_sign_in" => "homes#guest_sign_in", as: :guest_sign_in
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :index, :update, :destroy]
    resources :tags, only:[:index]
    resources :emotionalities, only:[:new, :create,:update]
    resources :extraversions, only:[:new, :create,:update]
    resources :controllabilities, only:[:new, :create,:update]
    resources :attachments, only:[:new, :create,:update]
    resources :playabilities, only:[:new, :create,:update]
  end

  # 管理者用
  namespace :admin do
    root to: "homes#top"
    get "/search" => "homes#search"
    get "/search_tag" => "posts#search_tag"
    get "/analysis" => "analyses#index"
    resources :posts, only: [:index, :show, :update, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :users, only: [:index, :show]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :tags, only:[:index]
  end
  #存在しないパスを検索した時'/'へはじかれる
  match '*path', to: redirect('/'), via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
