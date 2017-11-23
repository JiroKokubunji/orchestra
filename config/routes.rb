Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  post '/project_data/process_columns',
        to: 'project_data#process_columns',
        as: 'process_columns'
  post '/machine_learning_algorithms/training',
        to: 'machine_learning_algorithms#training',
        as: 'ml_training'
  get '/machine_learning_algorithms/select_ml_algorithms',
        to: 'machine_learning_algorithms#select_ml_algorithms',
        as: 'select_ml_algorithms'
  get '/preprocess_algorithms/select_preprocess_algorithms',
        to: 'preprocess_algorithms#select_preprocess_algorithms',
        as: 'select_preprocess_algorithms'
  post '/preprocess_algorithms/register_preprocess_algorithms',
        to: 'preprocess_algorithms#register_preprocess_algorithms',
        as: 'register_preprocess_algorithms'
  post '/project_datum_columns/toggle_active',
        to: 'project_datum_columns#toggle_active'
  post '/project_datum_columns/set_target',
        to: 'project_datum_columns#set_target'
  get '/classification_training_results/results',
        to: 'classification_training_results#results',
        as: 'classification_training_results'

  resources :classification_results
  resources :machine_learning_algorithms
  resources :preprocess_algorithms
  resources :projects, shallow: true do
    resources :project_data, shallow: true do
      resources :project_datum_columns
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#new'
end
