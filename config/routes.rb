Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/new' => 'items_new_path'
  resources :items do
    resources :shoppings, only: [:index, :new, :create]
  end
end