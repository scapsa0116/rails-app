Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'pictures#index'
  resources :users
  resources :reviews 
  resources :pictures
  resources :sessions, only: [:create, :destroy]
  # get '/auth/:provider/callback' => 'sessions#create'
  # get "/login", to: redirect("/auth/google_oauth2")
  # get "logout", to: "sessions#destroy"

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/get_current_user', to: 'sessions#get_current_user'
  

  resources :users do 
    resources :pictures
  end

  
  
  resources :pictures do
    resources :reviews 
  end
end
