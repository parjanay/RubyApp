Rails.application.routes.draw do
  #resources :users
  resources :articles, only: [:show, :index, :create, :new]
  root 'pages#home'
  get 'about',to: 'pages#about'
end
