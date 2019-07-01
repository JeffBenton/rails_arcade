Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  root 'sessions#new'

  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/plays/show', to: 'plays#show'
  post '/play', to: 'plays#create'
end
