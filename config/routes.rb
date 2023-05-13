Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts/create", to: "posts#create", as: :posts
end
