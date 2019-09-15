Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :users do
    member do
      delete :delete_image_attachment
    end
  end

  root 'pages#index'
end
