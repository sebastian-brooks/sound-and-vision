Rails.application.routes.draw do
  resources :songs
  resources :artists
  devise_for :users

  root to: "pages#index"
  get "/pages/index"
  get "/admin", to: "pages#admin", as: "admin"
  post "/search", to: "pages#search", as: "search"

  post "/songs/:id/:type/buy", to: "songs#buy", as: "buy"
  get "/songs/:id/:type/success", to: "songs#success", as: "success"
  get "/songs/:id/cancel", to: "songs#cancel", as: "cancel"

  get "/purchases", to: "pages#purchases", as: "purchases"
end
