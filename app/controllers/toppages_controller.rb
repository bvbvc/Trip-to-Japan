class ToppagesController < ApplicationController
 def index
    if logged_in?
    
      @posts = current_user.feed_posts.order('created_at DESC').page(params[:page])
        @ranking_counts = Post.ranking
    @post = Post.find(@ranking_counts.keys)
    end
    
    
  end
end
