Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :meditations
  resources :collections

  resources :users do
    member do
      delete :delete_image_attachment
    end
  end

  root 'users#index'
end
