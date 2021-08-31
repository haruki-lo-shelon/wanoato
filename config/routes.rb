Rails.application.routes.draw do
  get 'courses/index' => 'course#index'
  get 'courses/new' => 'course#new'
  get 'courses/show' => 'course#show'
  get 'courses/edit' => 'course#edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 以下の二行をdevise_for :usersの下側に追記
  resources :courses
  root 'courses#index'
end
