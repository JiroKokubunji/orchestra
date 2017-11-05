Rails.application.routes.draw do

  resources :preprocess_algorithms
  resources :preprocesses
  resources :projects
  resources :preprocessed_datum
  resources :column
  resources :models
  resources :algorithms

  get 'analyses/:project_id/columns', to: 'analyses#columns'
  put 'projects/:project_id', to: 'projects#update'
  get 'projects/:id(/:preprocessed_datum_id)', to: 'projects#show'
  put 'columns/:id/target', to: 'columns#update_target', as: 'set_target'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#new'
end
