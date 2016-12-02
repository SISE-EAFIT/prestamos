Rails.application.routes.draw do
  resources :lends
  resources :post2s
  resources :elements
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Api definition
  namespace :api, defaults: {format: 'json'} do
       resources :students, only: [:index, :create, :destroy, :update, :show]
       resources :lends, only: [:index, :create, :destroy, :update, :show]
       resources :elements, only: [:index, :create, :destroy, :update, :show]
  end 
  
  root :to => "lends#index"
end
