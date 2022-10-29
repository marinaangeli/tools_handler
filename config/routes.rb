Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tools do
    resources :rentals, only: %i[new create]
  end
  resources :rentals, only: %i[show edit update destroy]
end
