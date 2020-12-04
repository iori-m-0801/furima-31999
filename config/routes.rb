Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'users/sign_in' => 'new_user_session_path'
  get 'users/sign_up' => 'new_user_registration_path'
  delete 'users/sign_out' => 'destroy_user_session_path'
end
