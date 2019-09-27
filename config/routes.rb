Rails.application.routes.draw do
  get 'posts/new'
  post 'posts/new', to: 'posts#create'
  get 'posts/index'
  get 'home/index'
  resources :posts
  devise_for :users

  devise_scope :user do
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
end
