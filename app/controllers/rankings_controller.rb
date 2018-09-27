class RankingsController < ApplicationController
  def favorite
     @ranking_counts = Post.ranking
    @posts = Post.find(@ranking_counts.keys)
  end
end
