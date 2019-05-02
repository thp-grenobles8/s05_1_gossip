Rails.application.routes.draw do
  root 'index#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/login', to: 'static#login'

  # get '/gossip/:id', to: 'gossip#get_id'
  # get '/user/:id', to: 'user#get_id', as: 'user'
  # get '/gossip/:id', to: 'gossip#get_id', as: 'gossip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
