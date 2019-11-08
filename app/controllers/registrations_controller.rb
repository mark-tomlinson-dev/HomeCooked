class RegistrationsController < Devise::RegistrationsController

	private
 
	# Modified Devise params for user login
	def sign_up_params
		params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :is_host)
	end

	def after_sign_up_path_for(resource)
		new_profile_path
	end

	def after_inactive_sign_up_path_for(resource)
		new_profile_path
	end


end
	