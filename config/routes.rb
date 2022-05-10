Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # gossips
  root to: 'gossips#index'
  # get '/gossips/:id', to: 'gossips#show', as: 'gossip' =>> fonctionne sans

  #resources
  resources :gossips

  # pages
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
  get '/welcome/:name', to: 'pages#welcome'

  # users
  get '/users/:id', to: 'users#show', as: 'user'
end
