Rails.application.routes.draw do
  get 'users/new'
  get 'login/login'
  root 'main#index'
  match 'login',:to => 'users#new',:via => :get
  match '/signup' ,:to => 'users#create',:via => :post

  get 'main/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
