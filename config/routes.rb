Rails.application.routes.draw do
  get 'friendship_request/index'
  get 'users/index'
  get 'users/show' => 'users#show'
  get 'home/index'
  resources :friendships, only: [:create, :index, :update]
  resources :posts, only: [:new, :index, :create, :edit, :destroy, :update ] do 
    resources :likes, only: [:new]
    resources :comments, only: [:create, :new]
  end
  resources :users, only: [:show]
  devise_for :users
  root 'home#index'
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
