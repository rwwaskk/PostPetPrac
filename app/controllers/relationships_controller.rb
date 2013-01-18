class RelationshipsController < ApplicationController

	def create
    	@user = User.find(params[:relationship][:followed_id])
    	current_user.follow!(@user)
    	@notification = Notification.new(params[:notification])
    	if @notification.save!
  		   @notifications = current_user.received_notifications
  		   @count=@notifications.count
  		   Pusher['private-'+params[:notification][:recipient_id]].trigger('new_message', {:count => @count,:content=> @notification.content})
      	end		
        redirect_to @user
  	end

	def destroy
    	@user = Relationship.find(params[:id]).followed
    	current_user.unfollow!(@user)
    	redirect_to @user
  	end
end
