Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :artists
  resources :albums, only: :index
  resources :galleries
  resources :links
  resources :movies

  namespace :admin do
    resources :artists do
      resources :albums
    end
    resources :listening_sessions do
      resources :listening_session_images, only: :destroy
      resources :listening_session_albums
      resources :listening_session_movies
    end
  end
end
