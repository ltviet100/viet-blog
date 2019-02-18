Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get 'about', to: 'pages#about'
  resources :articles
end
