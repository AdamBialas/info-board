Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :infos
  
  get '/desk/:id', to: "infos#desk"
  

  resources :users, only: [:show, :edit, :update]
  #get 'home/index'
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
