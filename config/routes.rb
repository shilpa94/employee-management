Rails.application.routes.draw do
  devise_for :employees, path: "employees",controllers: {
        registrations: 'employees/registrations'
      }
  resources :employees
  resources :leave_requests do
    post :approve, on: :member
    post :reject, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'employees#index'
end
