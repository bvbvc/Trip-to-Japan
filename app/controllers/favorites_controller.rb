class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
     
    post = Post.find(params[:post_id])
    user = post.user
    current_user.like(post)
      flash[:success] = 'like'
    redirect_to user
  end
  
  def destroy
    
    post = Post.find(params[:post_id])
    user = post.user
    current_user.unlike(post)
      flash[:success] = 'unlike'
    redirect_to user
  end
  
end
