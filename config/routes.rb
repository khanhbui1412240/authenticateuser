Rails.application.routes.draw do
  resources :users
  get '/login', to: 'authenicate#new'
  post '/login', to: 'authenicate#create'
  root to: 'blog#new'
  get '/logout',to: 'authenicate#delete', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
