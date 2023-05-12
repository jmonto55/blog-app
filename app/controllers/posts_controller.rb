class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(posts: { user_id: params[:user_id] })
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
