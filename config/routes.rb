Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    resources :users, only: [:index, :new, :create, :show] do
      resources :doctors, only: [:index, :new, :create, :show, :destroy] do
        resources :reservations, only: [:index, :new, :create, :show, :destroy, :update]   
      end
    end
    resources :home, only: [:index]
  end
end