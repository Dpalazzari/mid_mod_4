Rails.application.routes.draw do
  root to: "links#index"

  resources :users, only: [:new, :create]

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :update]
    end
  end
end
