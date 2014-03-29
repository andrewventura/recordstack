class RegistrationsController < Devise::RegistrationsController

	private

		def sign_up_params
			allow = [:username, :email, :password, :password_confirmation, :remember_me]
			params.require(resource_name).permit(allow)
		end
		
end