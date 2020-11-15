Rails.application.routes.draw do
  resources :songs
  resources :artists
  resources :genres
  devise_for :users
  
  root to: "pages#index"
  get "/admin", to: "pages#admin", as: "admin"
  post "/artist_song_search", to: "pages#artist_song_search", as: "artist_song_search"
  post "/genre_search", to: "pages#genre_search", as: "genre_search"
  
  post "/songs/:id/:type/buy", to: "songs#buy", as: "buy"
  get "/songs/:id/:type/success", to: "songs#success", as: "success"
  get "/songs/:id/cancel", to: "songs#cancel", as: "cancel"
  
  get "/purchases", to: "pages#purchases", as: "purchases"
  get "/account", to: "pages#account", as: "account"
end
