Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get 'albums', to: 'albums#index'

  resources :artists do
    resources :albums, except: :index
  end
  resources :galleries
  resources :links
  resources :listening_sessions do
    resources :listening_session_images, only: :destroy
    resources :listening_session_albums
    resources :listening_session_movies
  end
  resources :members, only: %i(index show)
  resources :movies
end
