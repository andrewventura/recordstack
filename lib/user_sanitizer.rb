class User::ParameterSanitizer < Devise::ParameterSanitizer
	private

	def sign_up
	end

	def account_update
		default_params.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :current_password, :bio, :favoritealbum, :location)
	end
end