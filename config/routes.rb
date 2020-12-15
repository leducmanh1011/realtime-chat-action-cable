Rails.application.routes.draw do
  root "conversations#index"
  devise_for :users, path: '', path_names:
  {sign_in: 'login', sign_out: 'logout'}

  resources :conversations
  resources :messages
end
