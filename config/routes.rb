Rails.application.routes.draw do

  resources :machine_learning_algorithms
  resources :preprocess_algorithms
  resources :projects
  resources :project_datum
  resources :project_datum_column

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#new'
end
