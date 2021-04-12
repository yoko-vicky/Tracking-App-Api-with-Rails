Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'auth/login'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index show create]
      resources :users, only: %i[index show create]
      resources :records, only: %i[index create destroy]
      post 'auth/login', to: 'auth#login'
      delete 'auth/logout', to: 'auth#destroy'
    end
  end
end
