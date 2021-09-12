Rails.application.routes.draw do
  resources :battings, only: [:index, :create]
  root to: 'battings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
