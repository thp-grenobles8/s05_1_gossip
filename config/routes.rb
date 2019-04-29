Rails.application.routes.draw do
  root 'index#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'

  get '/welcome/:user', to: 'user#identify'
  get '/gossip/:id', to: 'gossip#get_id'
  get '/user/:id', to: 'user#get_id', as: 'user'
  get '/gossip/:id', to: 'gossip#get_id', as: 'gossip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
