Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :new, :create, :show] do
      resources :doctors, only: [:index, :new, :create, :show] do
        resources :reservations, only: [:index, :new, :create, :show, :destroy, :update]   
      end
    end
    resources :home, only: [:index]
  end
end