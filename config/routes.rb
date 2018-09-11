Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :expenses
    resources :categories, only: [:show]
  end

  resources :expenses

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy', as: 'logout'

  root to: "static#welcome"

  get '/auth/facebook/callback' => 'sessions#create'

  # users/1/expenses
  # users/1/expenses/4

  # users/1/categories/2
    # this might have a list of all expenses under that category...
end
