Rails.application.routes.draw do
  resources :songs
  resources :artists
  resources :genres
  devise_for :users
  
  root to: "pages#index"
  
  post "/songs/:id/:type/buy", to: "songs#buy", as: "buy"
  get "/songs/:id/:type/success", to: "songs#success", as: "success"
  get "/songs/:id/cancel", to: "songs#cancel", as: "cancel"
  
  get "/genre_songs/:genre", to: "genres#genre_songs", as: "genre_songs"
  
  get "/admin", to: "pages#admin", as: "admin"
  get "/account", to: "pages#account", as: "account"
  get "/purchases", to: "pages#purchases", as: "purchases"
  get "/user/:id/:role", to: "pages#change_role", as: "change_role"
  get "/search", to: "pages#search", as: "search"
  post "/search_results/:type", to: "pages#search_results", as: "search_results"
end
