Rails.application.routes.draw do
  root 'users#new'
  resources :users
  
  resources :pictures do
    collection do
      post :confirm
    end
  end
  
  resources :sessions
end