Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do

    root 'devise/sessions#new'
  end
  devise_scope :users do
  authenticated :users do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
end
