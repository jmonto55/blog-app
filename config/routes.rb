Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts/create", to: "posts#create", as: :posts
  post "/users/:user_id/posts/:id/add_like", to: "likes#add_like"
  post "/users/:user_id/posts/:id/add_comment", to: "comments#add_comment"
end
