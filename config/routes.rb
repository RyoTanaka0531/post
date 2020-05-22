Rails.application.routes.draw do
  devise_for :users

  root 'item#index'

  resources :users
  resources :items, only: [:index, :show, :new, :create] do
    resourece :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
