class PostsController < ApplicationController
  def new
    @post = current_user.posts.build  
      
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
  end

  private

  def post_params
    params.require(:post).permit(:content, :category_id, :place_id, :eye_catch, :title)
  end
end