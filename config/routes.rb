Rails.application.routes.draw do
  resources :users
  resources :coin_wallets
  resources :wallets
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
