Rails.application.routes.draw do
  root "home#index"

  resources :artists

  namespace :admin do
    resources :artists do
      resources :albums
    end
    resources :listening_sessions do
      resources :listening_session_images, only: :destroy
      resources :listening_session_albums
    end
  end
end
