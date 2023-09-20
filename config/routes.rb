Rails.application.routes.draw do
  devise_for :employees, controllers: {
        sessions: 'employees/sessions',
        passwords: 'employees/passwords',
        registrations: 'employees/registrations'
      }

  resources :departments
  resources :roles
  resources :employees
  resources :attendances
  resources :leaves do
    member do
      patch 'approve' # Route for approving leave request
      patch 'deny'    # Route for denying leave request
    end
  end
  # other routes as needed
  root 'employees#index'

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end

end
