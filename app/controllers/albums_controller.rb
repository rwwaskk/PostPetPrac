class AlbumsController < ApplicationController
  before_filter :set_notifications
	def set_notifications
  		@notifications = current_user.received_notifications
	end


   def destroy
   @user=current_user
   @album=Album.find_by_id(params[:id])
   if @album.destroy
   flash[:success] = "album deleted!"
      	redirect_to user_path(@user)
      	end
   end
   
	def show
	    @album=Album.find(params[:id])
	    2.times {@album.photos.build}
	end


	def new
		@album=Album.new
		2.times{@album.photos.build}
	end


	def edit
		@album=Album.find_by_id(params[:id])
		2.times{@album.photos.build}
	end

	def create
    	@user=current_user
		@album = @user.albums.build(params[:album])
    	@user=current_user
    	if @album.save
      		flash[:success] = "album created!"
      		redirect_to album_path(@album)
    	else
      		redirect_to album_path(@album)
    	end
	end

	def update

		@album=Album.find_by_id(params[:id])
		@album.update_attributes(params[:album])
		if @album.save!
      		flash[:success] = "album updated!"
      		redirect_to album_path(@album)
    	else
      		redirect_to album_path(@album)
   	 	end
	end


	def index
		@albums=Album.all
	end

end
