Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get '/items/search' => 'items#search'
  get '/items/random_page' => 'items#random_page'
  get '/items/random' => 'items#random'
  get '/users/new_select' => 'users#new_select'
  post 'users/pay' => 'users#pay'
  post 'users/card_delete' => 'users#card_delete'
  resources :items,only: [:index,:new,:create,:show,:edit,:update,:destroy] do
    member do
      get 'purchase' => 'items#purchase'
      patch "purchase_patch" => 'items#purchace_patch'
    end
  end
  resources :users,only: [:show,:create] do
    member do
      get 'logout_page' => 'users#logout_page'
      get 'profile' => 'users#profile'
      get 'identification' => 'users#identification'
      get 'card' => 'users#card'
      get 'card_create' => 'users#card_create'
    end
  end
end