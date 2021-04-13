Rails.application.routes.draw do
  resources :items, only: %i[index show create]
  resources :users, only: %i[index show]
  resources :records, only: %i[index create destroy]
  post '/signup', to: 'users#create'
  get '/login', to: 'autho#login'
  post '/login', to: 'auth#login'
  delete '/logout', to: 'auth#destroy'
end
