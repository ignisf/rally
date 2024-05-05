Rails.application.routes.draw do
  namespace :admin do
    resources :route_points
    resources :teams
    resources :treasures
    resources :treasure_discoveries

    root to: "teams#index"
  end

  scope module: :players do
    resource :dashboard, only: :show
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
