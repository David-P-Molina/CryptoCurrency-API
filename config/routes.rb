Rails.application.routes.draw do
  get 'private/test'
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :coin_wallets
  resources :wallets
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
