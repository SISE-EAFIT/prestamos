Rails.application.routes.draw do
  resources :loans
  resources :post2s
  resources :posts
  resources :elements
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Api definition
  namespace :api, defaults: { format: :json} do #, path: '/', defaults: { format: :json} do
    
     #scope module: :v1 do
       # We are going to list our resources here
       resources :students #, only: [:index, :create, :destroy, :update, :show]
     #end
  end 
end
