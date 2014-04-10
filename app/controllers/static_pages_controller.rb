class StaticPagesController < ApplicationController
  def blog
    @feed_items = Post.all.paginate(page: params[:page])
    @recent_feed_items = Post.find(:all, :limit => 5)
  end

  def contact
  end

  def about
  end
end
