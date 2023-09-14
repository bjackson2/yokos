Rails.application.routes.draw do
  root "admin#index"

  resources :artists

  namespace :admin do
    resources :artists do
      resources :albums
    end
    resources :listening_sessions
  end
end
