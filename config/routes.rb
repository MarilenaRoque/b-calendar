Rails.application.routes.draw do
  resources :meetings, except: [:index, :edit, :update]
  resources :rooms, except: [:edit, :update]
  root to: "rooms#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
