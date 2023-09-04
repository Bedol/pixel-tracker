Rails.application.routes.draw do
  resources :links, only: %i[index create] do
    collection do
      get ':owner_code/:code', to: 'links#show'
    end
  end
  resources :opens, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
