Rails.application.routes.draw do
  devise_for :users

  root 'reviews#static_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews
end
