Rails.application.routes.draw do
  resources :consciousmesses
  resources :ripples #, only: [:show, :index, :new, :create]

  root "ripples#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
