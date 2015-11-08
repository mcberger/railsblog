class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created successfully."
      redirect_to login_path
    else
      flash[:alert] = "There was a problem saving your account."
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes params[:user]
      flash[:notice] = "Your information was updated successfully."
      redirect_to user_path user
    else
      flash[:notice] = "There was a problem updating your information."
      redirect_to edit_user_path
    end
  end


end
