Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  jsonapi_resources :games #, only: [:show, :create, :update]
  jsonapi_resources :users

  # Defines the root path route ("/")
  # root "articles#index"
end
