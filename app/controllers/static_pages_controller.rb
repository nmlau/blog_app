class StaticPagesController < ApplicationController
  def blog
    @feed_items = Post.where("private = ?", false).paginate(page: params[:page])
    @recent_feed_items = Post.where("private = ?", false).limit(5)
  end

  def archive
    @posts = Post.where("private = ?", false)
  end

  def about
  end

  def beerware
  end

end
