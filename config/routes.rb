Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users do 
    resources :workouts do 
      resources :exercises, only: [:new, :create, :show], shallow: true
    end
    resources :date_ofs, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      resources :diets, shallow: true
      resources :sleeps, shallow: true 
    end
  end

  root 'users#main'

  post '/users/:id/myworkout/', to: 'users#myworkout'
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  get '/exercises', to: 'exercises#index'

  get '/:id/add_to_workout', to: 'exercises#add_to_workout'

end
