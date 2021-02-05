Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'
  get '/signup' => 'users#new'
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
  get '/swaps', to: 'swaps#index', as: 'swaps'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  get '/users/omniauth/new', to: 'users#omniauth_new', as: 'omniauth_new'
  post '/users/:id', to: 'users#omniauth_create'
  get '/swaps/new', to: 'swaps#new', as: 'new_swap'
  get '/swaps/:id', to: 'swaps#show', as: 'swap'
  
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
