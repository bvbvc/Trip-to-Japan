class PostsController < ApplicationController
   before_action :correct_user, only: [:destroy]
    before_action :require_user_logged_in
  
   def index
    @posts = Post.all
    @search = Post.ransack(params[:q])  #追加
    @result = @search.result           #追加
    render :search_start
    
  end
  def search_start
    #@posts  = Post.all
    @posts = []
    @search = Post.ransack(params[:q])  #追加

    if (params[:q] != nil)
      @result = @search.result
    else 
      @result = []
    end
    
    
  end
  
  
  def place_search
    
    ###
    @place_id = params[:post][:place]

    @posts  = Post.all
    @search = Post.ransack(params[:q])  #追加


    @result = Post.where(place_id: @place_id)
    render :search_start
    
    
    
  end
  
   def category_search
 
    
    ###
    @category_id = params[:post][:category]

    @posts  = Post.all
    @search = Post.ransack(params[:q])  #追加


    @result = Post.where(category_id: @category_id)
    render :search_start
    
    
    
  end
  
  
  
  
  def new
    @post = current_user.posts.build  
      
  end
  
  
  def show
    
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'success'
      redirect_to user_path(current_user)
    else
      @posts = current_user.feed_posts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'fail'
    redirect_to new_post_path
    end
  end

 def destroy
    @post.destroy
    flash[:success] = 'success'
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