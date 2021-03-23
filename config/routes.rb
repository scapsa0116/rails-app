Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'pictures#index'
  resources :users
  resources :reviews 

  resources :users do 
    resources :pictures
  end

  
  
  resources :pictures do
    resources :reviews 
  end
end
