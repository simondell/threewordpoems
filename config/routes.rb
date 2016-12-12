Rails.application.routes.draw do

  root 'static_pages#home'

  # static pages
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/styleguide', to: 'static_pages#styleguide'

  # poets resource
  resources :poets
  get '/signup', to: 'poets#new'
  post '/signup', to: 'poets#create'

  # poems resource
  resources :poems, only: [:create, :destroy, :new, :show]

  # sessions "resource"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # activations "resource"
  resources :account_activations, only: [:edit]

  # password resets resource
  resources :password_resets, only: [:create, :edit, :new, :update]
  get 'password_resets/new'
  get 'password_resets/edit'

  # admin routes
  namespace :editorial do
    resources :poems, only: [:index, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
