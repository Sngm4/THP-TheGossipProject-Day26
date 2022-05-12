Rails.application.routes.draw do
  get 'likes/index'
  get 'sessions/index'
  get 'comment/edit'
  get 'cities/show'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # gossips
  root to: 'gossips#index'
  # get '/gossips/:id', to: 'gossips#show', as: 'gossip' =>> fonctionne sans

  #resources
  resources :gossips
  resources :users
  resources :cities, only:[:show]
  resources :gossips do 
    resources :comments 
    resources :likes
  end

  resources :sessions

  # pages
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
  get '/welcome/:name', to: 'pages#welcome'

  # users
  #get '/users/:id', to: 'users#show', as: 'user'
end
