Rails.application.routes.draw do
  post '/administration/show'
  post 'administration/index'

  get 'administration/index'
  get 'administration/new'
  post '/administration/client'

  resources :administration

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'administration#index'
end
