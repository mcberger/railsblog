class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find_by_id(params[:post_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    current_user = User.find_by_id(session[:user_id])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Your comment was created successfully."
      redirect_to @post
    else
      flash[:alert] = "There was a problem saving your comment."
      redirect_to new_comment_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.destroy
      flash[:notice] = "Your post was deleted successfully."
    else
      flash[:alert] = "There was a problem deleting your post."
    end
    redirect_to post_path @post
  end

  end
