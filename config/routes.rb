Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tools do
    resources :rentals, only: %i[new create]
  end
  resources :rentals, only: %i[show edit update destroy]
  get "my_tools", to: "tools#my_tools"
  get "my_rentals", to: "rentals#my_rentals"
end
