Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: :show do 
    resources :date_ofs, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      resources :workouts, :diets, :sleeps
    end
  end

  resources :users
  root to: 'users#main'

end
