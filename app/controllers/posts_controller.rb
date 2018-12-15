class PostsController < ApplicationController
  before_action :load_post, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all.includes(:photos, :user, :likes).order_created_desc.limit(10)
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: params[:images][img])
        end
      end
      redirect_to posts_path
      flash[:notice] = "Successfully created..."
    else
      flash[:alert] = "Something went wrong..."
      redirect_to posts_path  
    end
  end
  
  def show
    @likes = @post.likes.includes(:user)
    @is_liked = @post.is_liked(current_user)
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:notice] = "Post deleted!"
      else
        flash[:alert] = "Something went wrong ..."
      end
    else
      flash[:notice] = "You don't have permission to do that!"
    end
    redirect_to posts_path
  end

  private 

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = "Post not exits..."
    redirect_to root_path
  end
  
  def post_params
    params.require(:post).permit :content
  end
end