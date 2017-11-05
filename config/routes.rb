Rails.application.routes.draw do

  resources :machine_learning_algorithms
  resources :preprocess_algorithms
  resources :projects do
    resources :project_datum do
      resources :project_datum_column
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#new'
end
