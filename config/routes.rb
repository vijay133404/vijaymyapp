Rails.application.routes.draw do
 

  resources :products
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources:blogs
  get'blogs/index'
  root'blogs#index'


resources :blogs do
  resources :comments
end
end
