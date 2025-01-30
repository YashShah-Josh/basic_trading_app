Rails.application.routes.draw do
  namespace :admin do
    get "market_trends/index"
    get "sellers/index"
    get "sellers/show"
    get "sellers/new"
    get "sellers/create"
    get "sellers/edit"
    get "sellers/update"
    get "trades/index"
    get "trades/show"
    get "users/index"
    get "users/show"
    get "users/edit"
    get "users/update"
    get "stocks/index"
    get "stocks/show"
    get "stocks/new"
    get "stocks/create"
    get "stocks/edit"
    get "stocks/update"
    get "stocks/destroy"
    get "dashboard/index"
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
