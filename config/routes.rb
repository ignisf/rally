Rails.application.routes.draw do
  namespace :admin, path: "super-secret-admin-69420" do
    resources :final_standings_entries, only: :index
    resources :teams
    resources :treasures
    resources :route_points

    root to: "final_standings_entries#index"
  end

  scope module: :players do
    resource :dashboard, only: :show
    get "not-enrolled" => "enrollments#missing"
    get "enroll" => "enrollments#create"

    resources :skips, only: :create

    resources :treasures, only: [], param: :code do
      resource :discovery, only: [:new, :create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  root "players/dashboards#show"
end
