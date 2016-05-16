class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like          = Like.new
    post          = Post.find params[:post_id]
    like.post     = post
    like.user     = current_user
    if like.save
      redirect_to post_path(post), notice: "Thanks for liking!"
    else
      redirect_to post_path(post), alert: "Can't like! Liked already?"
    end
  end

  def destroy
    post = Post.find params[:post_id]
    like     = current_user.likes.find params[:id]
    like.destroy
    redirect_to post_path(post), notice: "Like removed!"
  end


end