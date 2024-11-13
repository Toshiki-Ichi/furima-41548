Rails.application.routes.draw do
  devise_for :users
  root 'items#index' 
  resources :categories, only:[:new]
  get '/category/:id', to: 'categories#search'
  resources :items do
    resources :customers
  end
end
