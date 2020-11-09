Rails.application.routes.draw do
  resources :songs
  resources :artists
  devise_for :users

  root to: "pages#index"
  get "pages/index"
  get "/admin", to: "pages#admin", as: "admin"

  post "/songs/:id/buy", to: "songs#buy", as: "buy"
  get "/songs/:id/success", to: "songs#success", as: "success"
  get "/songs/:id/cancel", to: "songs#cancel", as: "cancel"
end
