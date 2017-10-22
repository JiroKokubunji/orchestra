Rails.application.routes.draw do
  get 'projects/index'

  get 'welcome/index'

  resources :projects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#new'
end
