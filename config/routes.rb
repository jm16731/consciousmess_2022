Rails.application.routes.draw do
  resources :consciousmesses
  resources :ripples #, only: [:show, :index, :new, :create]

  get 'newest' => "ripples#newest"
  get 'prev_10' => "ripples#prev_10"
  get 'next_10' => "ripples#next_10"
  get 'oldest' => "ripples#oldest"

  root "ripples#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
