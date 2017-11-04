Rails.application.routes.draw do

  get 'analyses/:project_id/columns', to: 'analyses#columns'
  put 'projects/:project_id', to: 'projects#update'

  resources :projects
  resources :preprocessed_datum
  resources :models
  resources :algorithms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#new'
end
