class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    
    post = Post.find(params[:post_id])
    current_user.like(post)
      flash[:success] = 'like'
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
      flash[:success] = 'unlike'
    redirect_back(fallback_location: root_url)
  end
  
end
