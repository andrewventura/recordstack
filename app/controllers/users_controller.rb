class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id] || [:username])
		
		respond_to do |format|
			format.html # show.html.erb
			format.xml { render :xml => @user }
		end
	end

	def update
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		# Before filters

		def admin_user
			redirect_to(root_url) unless current_user?(@user)
		end
end
