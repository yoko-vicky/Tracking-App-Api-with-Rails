Rails.application.routes.draw do
  resources :items, except: %i[new]
  resources :users, only: %i[show create]
  resources :login, only: %i[create]
  resources :auto_login, only: %i[create]
  resources :records, except: %i[new]
end
