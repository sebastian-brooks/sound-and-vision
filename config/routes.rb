Rails.application.routes.draw do
  resources :songs
  resources :artists
  devise_for :users

  root to: "pages#index"
  get "pages/index"
  get "/admin", to: "pages#admin", as: "admin"
end
