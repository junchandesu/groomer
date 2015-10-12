class UsersController < ApplicationController
	before_action :authenticate_user!
    def update
		if current_user.update_attributes(user_params)
			flash[:notice] = "user information updated."
			redirect_to edit_user_registration_path
		else
			flash[:error] = "Invalid user information."
			redirect_to edit_user_registration_path
		end
	end

	def show

	end

	private 

	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone_number)
	end
end