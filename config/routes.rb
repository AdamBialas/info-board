Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :infos do
    get '/like', to: "infos#like" 
    resources :comments    
  end
      
  get "/search/info", to: "infos#search"
  get "/desk/:id", to: "infos#desk"

  resources :users, only: [:show, :edit, :update]
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
