Rails.application.routes.draw do
  mount AuthProvider::Engine => '/oauth'

  resources :users, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
