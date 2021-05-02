Rails.application.routes.draw do
  resources :items, except: %i[new]
  resources :users, only: %i[show]
  resources :records, except: %i[new]
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  post '/auto_login', to: 'users#auto_login'
end
