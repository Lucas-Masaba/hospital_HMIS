Rails.application.routes.draw do
  resources :triages
  resources :visit_notes
  resources :drugs
  resources :prescriptions
  resources :patients
  resources :visits
  resources :normal_ranges
  resources :radiology_exams
  resources :attachments
  resources :pharmacies
  resources :lab_results
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations'
  }

  get '/staff_details' => 'staffs#index'

  resources :lab_tests
end
