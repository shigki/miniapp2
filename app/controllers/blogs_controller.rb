class BlogsController < ApplicationController
	before_action :move_to_index, except: [:index, :show]
  before_action :set_blogs, only: [:edit, :show, :destroy, :update]

	def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  	@blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title], image: blog_params[:image], text: blog_params[:text], user_id: current_user.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
    # @comments = @tweet.comments.includes(:user)
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :image, :text)
    end

    def move_to_index
      redirect_to action: :index  unless user_signed_in?
    end
    def set_blogs
      @blog = Blog.find(params[:id])
    end

  end