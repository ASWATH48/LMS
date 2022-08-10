# frozen_string_literal: true

Rails.application.routes.draw do
  get 'news/technews'
  get 'users/new'
  get 'login/login'
  root 'main#index'

  get 'signup' => 'users#new'
  match '/index', to: 'main#index', via: :get

  match '/signup', to: 'users#create', via: :post
  match 'sessions/signin', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#delete', via: :get
  match '/signin', to: 'sessions#new', via: :get
  match '/course', to: 'course#course_index', via: :get
  match '/course/html', to: 'course#html_course', via: :get
  match '/course/css', to: 'course#css_course', via: :get
  match '/course/js', to: 'course#js_course', via: :get
  match '/news', to: 'news#technews', via: :get
  match '/news/post', to: 'news#addpost', via: :post
  match '/blog/myblogs', to: 'news#myblogs', via: :get
  match '/blog/:id', to: 'news#delete', via: :get
  match '/blog/edit/:id', to: 'news#edit', via: :get
  match '/like_blog/:like_id', to: 'news#like_blog', via: :get
  match '/blogs', to: 'news#edit', via: :get
  match '/blogs', to: 'news#edit', via: :post

  get 'main/index'
  resources :news
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
