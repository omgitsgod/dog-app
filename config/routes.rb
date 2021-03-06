Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'dogs#index'
resources :users
resources :events
resources :dogs
resources :user_events
resources :shelters
resources :conversations do
  resources :messages
 end
 resources :wishlists

resources :sessions, only: [:new, :create]

get "/users#settings", to: "users#settings", as: "settings"

 delete "/sessions", to: "sessions#destroy", as: "session"


end
