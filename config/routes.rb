Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :users do
    get '/expenses/stats' => 'expenses#stats', as: 'expenses_stats'
    get '/expenses/last_five' => 'expenses#last_five', as: 'expenses_last_five'
    get '/expenses/:id/jsontest' => 'expenses#jsontest'
    resources :expenses
    resources :categories, only: [:show]
  end

  resources :expenses

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy', as: 'logout'

  root to: "static#welcome"

  get '/auth/facebook/callback' => 'sessions#create'

end
