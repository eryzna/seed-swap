Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new'
  root 'static#home'
  #post '/signup', to:'users#create'
  #get '/users/:id', to: 'users#show'
  #get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users/:id', to: 'users#update', as: 'update_user'
 
  get '/auth/facebook/callback' => 'session#create'
  get '/swaps', to: 'swaps#index', as: 'swaps'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  
  get '/swaps/new', to: 'swaps#new', as: 'new_swap'
  #get '/seeds/new', to: 'attractions#new', as: 'new_attraction'
  get '/swaps/:id', to: 'swaps#show', as: 'swap'
 # get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  
 # post '/attractions', to: 'attractions#create'
 # post '/rides', to:"rides#create", as: 'rides'
  resources :seeds, only: [:show] do
    resources :swaps, only: [:index, :show, :new]
  end
  
  resources :users, only: [:show] do
  # nested resource for posts
    resources :swaps, only: [:index, :show]
  end



  

 resources :users
 resources :seeds
 resources :swaps
end
