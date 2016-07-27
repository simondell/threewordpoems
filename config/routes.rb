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

  # sessions "resource"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
