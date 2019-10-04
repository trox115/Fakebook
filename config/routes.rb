Rails.application.routes.draw do
  get 'users/index'
  get 'users/show/:id', to: 'users#show', as: :user
  get 'users/:id/friendship', to: 'friendships#create', as: :friendship
  get 'users/:id/friendshipconfirm', to: 'friendships#update', as: :friendship_confirm
  get 'home/index'
  
  resources :posts, only: [:new, :index, :create, :edit, :destroy, :update ] do 
    resources :likes, only: [:new]
    resources :comments, only: [:create, :new]
  end
  resources :friendships, only: [:index]
  
  
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
