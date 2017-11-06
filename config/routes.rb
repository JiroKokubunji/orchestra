Rails.application.routes.draw do

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
