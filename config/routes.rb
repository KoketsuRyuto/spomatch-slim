Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/' => 'users#index'
    resources :users, only: ["show", "edit", "update"]
    resources :sports, only: ["index", "create", "edit", "update", "destroy"]
    resources :tags, only: ["index", "create", "edit", "update"]
    resources :posts, only: ["index", "show", "destroy"]
    resources :post_comments, only: ["index", "show", "destroy"]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'top' => 'homes#about'
    resources :users, only: ["show", "edit" ,"update"]
    get 'users/:id/confilm' => 'users#confilm', as: 'users/confilm'
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'users/withdraw'
    resources :posts do
      resources :post_comments, only: ["create", "destroy"]
      resource :favorites, only: ["create", "destroy"]
    end
    get 'search_tag/:tag_id' => 'posts#search_tag', as: 'search_tag'
    get 'search_sport/:sport_id' => 'groups#search_sport', as: 'search_sport'
    resources :groups do
      resources :group_chats, only: ["show", "create"]
      get 'join' => 'groups#join'
      delete 'withdraw' => 'groups#withdraw'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
