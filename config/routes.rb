Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/show'
  get 'users/destroy'
  get 'users/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts
  resources :comments
end
