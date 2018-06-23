Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :coordinators
  resources :designations
  resources :employees
  resources :employee_designations
  resources :employee_workplaces
  resources :members
  resources :member_designations
  resources :mentors
  resources :programs
  resources :schools
  resources :sponsors
  resources :sponsor_programs
  resources :students
  resources :student_coordinators
  resources :student_mentors
  resources :student_programs
  resources :student_schools
  resources :student_sponsors
  resources :student_supports
  resources :student_volunteers
  resources :supports
  resources :volunteers
  resources :volunteer_schools
  resources :workplaces

  get 'home/index'
  root 'home#index'
end
