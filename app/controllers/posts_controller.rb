class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(posts: { user_id: params[:user_id] })
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.author = current_user
    if @new_post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
