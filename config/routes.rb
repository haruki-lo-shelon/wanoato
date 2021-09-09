Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 以下の二行をdevise_for :usersの下側に追記
  resources :courses do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'courses#index'
end