Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'
end
