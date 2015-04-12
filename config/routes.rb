Rails.application.routes.draw do
  
  get 'products/index'

  get 'score' => 'table_scores#show'
  get 'fee_show' => 'fees#show'
  get 'sessions/new'
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :courses
  resources :users
  resources :faculties
  resources :subjects
  resources :activities
  resources :class_students
  resources :scores
  resources :table_scores
  resources :total_scores
  resources :requests
  resources :fees 

  resources :products do
    collection { post :import }
  end

  namespace :admin do
    # root 'requests#index'
    resources :courses, except: [:show]
  end

end
