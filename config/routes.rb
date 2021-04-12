Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index show create]
    end
  end
end
