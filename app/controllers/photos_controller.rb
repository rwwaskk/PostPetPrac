class PhotosController < ApplicationController

	before_filter :set_notifications
	def set_notifications
  		@notifications = current_user.received_notifications
	end


	def destroy
   		@user=current_user
   		@photo=Photo.find_by_id(params[:id])
   		@album=@photo.album
   		if @photo.destroy
   			flash[:success] = "photo deleted!"
      		redirect_to album_path(@album)
      	end
   end

	def new
		@photo = Photo.new
	end

	def edit
		@photo=Photo.find_by_id(params[:id])
	end

	def update
		@photo=Photo.find_by_id(params[:id])
		@photo.update_attributes(params[:photo])
		if @photo.save!
      		flash[:success] = "description updated!"
      		respond_to do |format|
     		format.html 
      		format.json 
      		format.js   { render :layout => false }
   			end
    	else
      		redirect_to photo_path(@photo)
   		end
	end

	def show
		@photo=Photo.find(params[:id])
		@album=Album.find_by_id(params[:album_id])
		@event=Event.find_by_id(params[:event_id])
		
		if !@album.nil?
			photos=@album.photos
		else
			photos=@event.photos
		end
		
		index=photos.index(@photo)
		next_index=index+1
		@next=photos[index+1]
		if @next.nil?
			@next=photos.first
		end
	end


	def create
    	@album=Album.find(params[:album_id])
		@photo = @album.photos.build(params[:photos])
    	@photo.save!
    	redirect_to album_photo_path(@album,@photo)
	end

	def index
		if params[:album_id].nil?
			@event=Event.find(params[:event_id])
			@photos=@event.photos
		else
		@album=Album.find(params[:album_id])
		@photos=@album.photos
		end
		
	end

	def add_comment
  		@photo=Photo.find_by_id(params[:id])
    	@microcomment = @photo.microcomments.build(params[:microcomment]) do |c|
     	c.user=current_user
    end
  if @microcomment.save!
  		flash[:success] = "comments created!"
        redirect_to photo_path(@photo)
    else
  render 'static_pages/home'
  end
end

end
