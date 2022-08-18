# frozen_string_literal: true

Rails.application.routes.draw do
  get 'news/technews'
  get 'users/new'
  get 'login/login'
  root 'main#index'

  get '/signup' => 'users#new'
  match '/index', to: 'main#index', via: :get
  match '/signup', to: 'users#create', via: :post
  match 'sessions/signin', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#delete', via: :get
  match '/signin', to: 'sessions#new', via: :get
  match '/course', to: 'course#course_index', via: :get
  match '/course/html', to: 'course#html_course', via: :get
  match '/course/css', to: 'course#css_course', via: :get
  match '/course/js', to: 'course#js_course', via: :get


  match '/allblogs', to: 'news#technews', via: :get
  match '/blog/addblog', to: 'news#addblog', via: :get
  match '/blog/create', to: 'news#addpost', via: :post
  match '/blog/myblogs', to: 'news#myblogs', via: :get
  match '/blog/delete/:id', to: 'news#delete_blog', via: :get
  match '/blog/edit/:id', to: 'news#edit', via: :get
  match '/blog/likedblogs', to: 'news#likedblogs', via: :get
  match '/like_blog/:like_id', to: 'news#like_blog', via: :get
  match '/blogs', to: 'news#edit', via: :get
  match '/blogs', to: 'news#edit', via: :post
  match '/delete_liked_blog/:id' , to: 'news#delete' , via: :get
  match '/blogs', to: 'news#edit', via: :post

  
  match '/quiz', to: 'quiz#quiz', via: :get
  match '/quiz/home', to: 'quiz#quiz_index', via: :get
  match '/quiz/question/:id', to: 'quiz#question', via: :get
  match '/question/create' , to: 'quiz#create_quest', via: :post
  match '/quiz/create', to: 'quiz#create', via: :post
  match '/quiz/createquiz', to: 'quiz#create_quiz', via: :post
  get "/quiz/question", to: 'quiz#question'
  get "/quiz/qno/:qno" , to: 'quiz#question' 
  get "/quiz/qno/delete/:del_id" , to: 'quiz#delete_quest' 





  get 'main/index'
  resources :news

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
