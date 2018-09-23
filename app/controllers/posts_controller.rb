class PostsController < ApplicationController
   before_action :correct_user, only: [:destroy]
    before_action :require_user_logged_in
  
  def new
    @post = current_user.posts.build  
      
  end
  
  
  def show
    
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました。'
      redirect_to user_path(current_user)
    else
      @posts = current_user.posts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
    redirect_to new_post_path
    end
  end

 def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:content, :category_id, :place_id, :eye_catch, :title)
  end
 def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end