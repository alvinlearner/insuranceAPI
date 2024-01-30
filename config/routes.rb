Rails.application.routes.draw do
  resources :transactions
  resources :clients
  resources :insurance_companies
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


        # Sessions routes
        # get '/login', to: 'sessions#new', as: 'login'
        # post '/login', to: 'sessions#create'
    
        # get :logged_in, to: "sessions#logged_in"
    
        delete '/logout', to: 'sessions#destroy', as: 'logout'




        post "/login", to: "sessions#create"
        get "/authorized", to: "sessions#show"




  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
