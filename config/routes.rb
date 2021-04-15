Rails.application.routes.draw do
  root to: 'static#home'
  resources :items, except: %i[new]
  resources :users, only: %i[index show]
  resources :records, only: %i[index create destroy]
  post '/signup', to: 'registrations#signup'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#logged_in?'
end
