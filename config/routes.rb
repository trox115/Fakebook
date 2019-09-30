Rails.application.routes.draw do
  get 'users/index'
  get 'posts/new'
  post 'posts/new', to: 'posts#create'
  get 'posts/index'
  get 'home/index'
  resources :posts, only: [:new, :index, :create]
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
