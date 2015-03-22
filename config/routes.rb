Rails.application.routes.draw do
  
  get 'activities/show'
  get 'scopes/show'
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
end
