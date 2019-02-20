Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/edit'
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  resources :users, except: [:new]
  get 'signup', to:'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
end
