Rails.application.routes.draw do
  root to: 'static#home'
  resources :items, only: %i[index show create]
  resources :users, only: %i[index show]
  resources :records, only: %i[index create destroy]
  post '/signup', to: 'registrations#signup'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in?'
end
