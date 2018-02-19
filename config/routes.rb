Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'orders#welcome' # root is equal to get '/' => controller#action

  resources :orders, only: [:index, :show]
end
