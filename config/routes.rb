Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/styleguide', to: 'static_pages#styleguide'

  get 'signup', to: 'poets#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
