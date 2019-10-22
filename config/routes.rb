Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show]
  resources :meditations
  resources :collections

  resources :users do
    member do
      delete :delete_image_attachment
    end
  end

  root 'users#index'
end
