class StaticPagesController < ApplicationController
  def blog
    #@feed_items = current_user.feed.paginate(page: params[:page])
  end

  def contact
  end

  def about
  end
end
