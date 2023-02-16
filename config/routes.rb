Rails.application.routes.draw do
  resources :visits
  resources :normal_ranges
  resources :radiology_exams
  resources :attachments
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
