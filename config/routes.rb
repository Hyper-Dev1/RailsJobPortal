Rails.application.routes.draw do
  # Devise authentication for companies
  devise_for :companies

  # Admin Panel (Dashboard & Resources)
  namespace :admin do
    get "dashboard", to: "dashboard#index" # Admin dashboard route
    resources :jobs, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :applications
    resources :contacts
  end

  # API Routes
  namespace :api do
    namespace :v1 do
      post 'register', to: 'authentication#register'
      post 'login', to: 'authentication#login'
      get 'profile', to: 'authentication#profile'
      resources :jobs, only: [:index, :show]
      resources :applications, only: [:create]
      resources :contacts, only: [:create]
    end
  end

  root to: "admin/dashboard#index" # Make sure this exists
end
