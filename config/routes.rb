Rails.application.routes.draw do
  devise_for :employees, controllers: {
        sessions: 'employees/sessions',
        passwords: 'employees/passwords',
        registrations: 'employees/registrations'
      }

  resources :departments
  resources :roles
  resources :employees
  resources :leaves
  resources :attendances
  # other routes as needed
  root 'employees#index'

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end

end
