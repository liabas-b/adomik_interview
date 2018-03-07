Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'exercise_one#index'
  get 'exercise_one', to: 'exercise_one#index'
  get 'exercise_one/download_sample', to: 'exercise_one#download_sample'
  post 'exercise_one/transform', to: 'exercise_one#transform'
end
