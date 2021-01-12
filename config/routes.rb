Rails.application.routes.draw do
  resources :meetings
  resources :rooms, except: [:edit, :update]
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
