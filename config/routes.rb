Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :student_assignments
    get '/students/:id/complete', to: "student_assignments#complete", as:'complete_assignment'
    post '/students/:id/complete', to: "student#show"
  resources :assignments
  get "assignements/status/:assignment_id/:cohort_id", to: 'assignments#status'
  resources :tasks
  resources :cohorts
  resources :cohort_assignments
  resources :instructor_cohorts
  resources :instructors
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
