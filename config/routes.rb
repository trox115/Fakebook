Rails.application.routes.draw do
  get 'users/index'
  get 'users/show' => 'users#show'
  get 'home/index'
  resources :posts, only: [:new, :index, :create, :edit, :destroy, :update ] do 
    resources :likes, only: [:new]
  end
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
