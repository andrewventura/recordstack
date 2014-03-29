class Album < ActiveRecord::Base
	belongs_to :stack

	def index
	end

	def create
		@album = current_user.albums.build(album_params)
		if @album.save
			flash[:success] = "Nice."
			redirect_to root_url
		else
			render 'stacks/home'
		end
	end

	def destroy
	end 

	private

		def album_params
			params.require(:album).permit(:album)
		end
end
