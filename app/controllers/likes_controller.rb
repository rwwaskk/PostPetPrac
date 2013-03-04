class LikesController < ApplicationController

	before_filter :set_notifications
	def set_notifications
  		@notifications = current_user.received_notifications
	end
	
	
	def show
	@like = Like.find(params[:id])
	end

	def index
		@likes=current_user.likes
	end

	
	def create
		@like = current_user.likes.new(params[:like])
		@micropost=Micropost.find_by_id(@like.micropost_id)
		@photo=Photo.find_by_id(@like.photo_id)
		@notification = Notification.new(params[:notification])
		
		if @like.save && @notification.save!
		    #redirect_to like_path(@like)
      		flash[:success] = "liked it:)"
      		@notifications = current_user.received_notifications
      		@count=@notifications.count
      		Pusher['private-'+params[:notification][:recipient_id]].trigger('new_message', {:count => @count,:content=> current_user.name+ ' has liked your post!'})
      		respond_to do |format|
     		format.html {redirect_to likes_path}
      		format.json 
      		format.js   
   			end
      	else
     	 	render 'static_pages/home'
    	end
	end
	
	
	def destroy
	
		
		@like=Like.find_by_id(params[:id])
		@micropost=Micropost.find_by_id(@like.micropost_id)
		@photo=Photo.find_by_id(@like.photo_id)
   		if @like.destroy
   			flash[:success] = "disliked"
        end
        respond_to do |format|
     		format.html { redirect_to users_path }
      		format.json 
      		format.js   { render :layout => false }
   		end
	end
end
