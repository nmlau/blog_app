class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, :except => [ :index, :show ]

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

  def authenticate
    authenticate_or_request_with_http_basic do |email, password|
      #email == @user.email && password == @user.password
      user = User.find_for_authentication(:email => email)
      user.valid_password?(password) ? user : nil
    end
  end 

        
end
