Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/ar', to: 'sessions#show'
  resources :themes, only: [:index, :create]
  resources :furnitures, only: [:index, :show]
end
