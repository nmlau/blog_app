#http://www.reinteractive.net/posts/32-ruby-on-rails-3-2-blog-in-15-minutes-step-by-step
#followed this guide for basic scaffolding

#https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-role
#for adding admin boolean to user model

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, :except => [ :index, :show ]
  before_action :admin_user, :except => [ :index, :show ]


  def index
    @posts = Post.all
  end

  # set_post
  def show
  end

  def new
    @post = Post.new
  end

  # set_post
  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # set_post
  def update
    if @post.update(post_params)
     redirect_to @post, notice: 'Post was successfully updated.'
    else
     render action: 'edit'
    end
  end

  # set_post
  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
        
end
