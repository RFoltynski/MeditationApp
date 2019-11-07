Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  resources :users, only: %i[index show]
  resources :meditations do 
    resources :comments
  end
  resources :collections
  resources :subscriptions, only: [:create]

  resources :users do
    member do
      delete :delete_image_attachment
    end
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :meditations, only: [:show]
    end
  end

  root 'users#index'
end
