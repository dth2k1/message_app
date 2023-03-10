Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "chatrooms#index"
  resources :messages, only: [:index, :create]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout",to: "sessions#destroy"


  mount ActionCable.server, at: '/cable'
end
