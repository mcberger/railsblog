class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      flash[:notice] = "Your post was created successfully."
      redirect_to post_path @post
    else
      flash[:alert] = "There was a problem saving your post."
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update_attributes params[:post]
      flash[:notice] = "Your post was updated successfully."
      redirect_to post_path post
    else
      flash[:notice] = "There was a problem updating your post."
      redirect_to edit_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Your post was deleted successfully."
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem deleting your post."
      redirect_to post_path @post
    end
  end


end
