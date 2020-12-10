Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/new' => 'items_new_path'
  resources :items, only: [:index, :new, :create]
end