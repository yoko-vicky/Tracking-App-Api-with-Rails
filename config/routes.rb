Rails.application.routes.draw do
  root to: 'static#home'
  resources :items, except: %i[new]
  resources :users, only: %i[index show]
  resources :records, except: %i[new]
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
end
