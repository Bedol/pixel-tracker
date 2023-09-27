Rails.application.routes.draw do
  resources :links, only: %i[index create] do
    collection do
      get ':owner_code/:code', to: 'links#show'
      get ':owner_code/:code/glanced', to: 'links#glanced'
      get ':owner_code/:code/skimmed', to: 'links#skimmed'
      get ':owner_code/:code/readed', to: 'links#readed'
    end
  end
  resources :opens, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
