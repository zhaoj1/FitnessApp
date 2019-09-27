Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, :workouts, :diets, :moods, :sleeps, :charities

  root to: 'users#main'

end
