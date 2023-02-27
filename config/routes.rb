Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :show, :new, :create] do
      resources :doctors, only: [:index, :new, :create] do
        resources :reservations, only: [:index, :new, :create] 
      end
    end
    resources :home, only: [:index]
  end
end
