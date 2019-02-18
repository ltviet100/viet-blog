Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/edit'
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get 'about', to: 'pages#about'
  resources :articles
  resources :users, except: [:new]
  get 'signup', to:'users#new'
end
