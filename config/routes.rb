Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  post '/project_data/process_columns',
        to: 'project_data#process_columns',
        as: 'process_columns'


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
