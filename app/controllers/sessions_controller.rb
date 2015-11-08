class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(fname: params[:session][:fname], lname: params[:session][:lname]).first
		if @user && @user.password == params[:session][:password]
			session[:user_id] = @user.id
			redirect_to user_path @user
		else
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		@current_user = nil
		redirect_to login_path
	end

end
