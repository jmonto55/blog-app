class LikesController < ApplicationController
  def add_like
    @new_like = Like.new(author: current_user, post: Post.find(params[:id]))
    if @new_like.save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:id]}", notice: 'You Liked this post!'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
