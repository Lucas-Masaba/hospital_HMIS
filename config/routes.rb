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
  resources :diagnoses
  resources :radiology_results
  resources :lab_tests
  
  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations'
  }

  get '/staff_details' => 'staffs#index'
end
