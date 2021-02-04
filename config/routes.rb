Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new'
  #get '/static/signup' => 'users#new'
  root 'static#home'
  #post '/signup', to:'users#create'
  #get '/users/:id', to: 'users#show'
  #get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  
  #get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  #post '/users/:id', to: 'users#update', as: 'update_user'
 
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
  #match '/app/:provider/callback', to: 'session#create', via: [:get, :post]
  get '/swaps', to: 'swaps#index', as: 'swaps'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  get '/users/omniauth/new', to: 'users#omniauth_new', as: 'omniauth_new'
  post '/users/:id', to: 'users#omniauth_create'

  get '/swaps/new', to: 'swaps#new', as: 'new_swap'
  #get '/seeds/new', to: 'attractions#new', as: 'new_attraction'
  get '/swaps/:id', to: 'swaps#show', as: 'swap'
  #get '/seeds/new', to: 'seeds#new', as: 'new_seed'
 # get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  
 # post '/attractions', to: 'attractions#create'
 # post '/rides', to:"rides#create", as: 'rides'
  
 resources :users
 resources :seeds
 resources :swaps
 
 
  resources :seeds, only: [:show] do
    resources :swaps, only: [:index, :show, :new]
  end
  
  resources :users, only: [:show] do
  # nested resource for swaps
    resources :swaps, only: [:index, :show]
  end

 
end
