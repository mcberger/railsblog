module UserHelper

	def user_link user
		link_text = if user == current_user
						'you'
					else
						"#{user.fname} #{user.lname}"
					end
		link_to link_text, user_path(user)
	end

	def current_user
		# a ||= b
		# @current_user ||= User.find_by_id(session[:user_id])
		@current_user = @current_user || User.find_by_id(session[:user_id])
	end

	def new_members
		User.signed_up_recently 2
	end

	def newest_members
		User.signed_up_today 
	end

end