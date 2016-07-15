Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :student_assignments
    get '/students/:id/complete', to: "student_assignments#complete", as:'complete_assignment'
    post '/students/:id/complete', to: "student#show"
  resources :assignments
  get "assignments/status/:assignment_id/:cohort_id", to: 'assignments#status'
  resources :tasks
    get '/students/:id/complete_task', to: "tasks#task_complete", as:'complete_task'
    post '/students/:id/complete_task', to: "student#show"
  resources :cohorts
  resources :cohort_assignments
  resources :instructor_cohorts
  resources :instructors
  resources :students

    resources :users
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/not_allowed' => 'sessions#not_allowed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
