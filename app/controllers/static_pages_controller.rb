class StaticPagesController < ApplicationController
  def blog
    #@feed_items = Post.all.where("private = ?", false).paginate(page: params[:page])
    #@recent_feed_items = Post.where("private = ?", false).find(:all, :limit => 5)
    @feed_items = Post.all.paginate(page: params[:page])
    @recent_feed_items = Post.find(:all, :limit => 5)
  end

  def archive
    #@posts = Post.all.where("private = ?", false)
    @posts = Post.all
  end

  def about
  end

  def beerware
  end

end
