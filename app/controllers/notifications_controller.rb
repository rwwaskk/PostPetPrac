class NotificationsController < ApplicationController

 before_filter :authenticate_user!
  
  def index
    @notifications = current_user.received_notifications
  end
  
  def create
    @notification = Notification.new(params[:notification])
    
    if @notification.save
      flash[:notice] = "you created a message"
      redirect_to user_path(current_user)
      
      # Send a Pusher notification
      
      Pusher['private-'+params[:notification][:recipient_id]].trigger('new_message', {:content => @notification.content})
      flash[:notice]= Pusher['private-'+params[:notification][:recipient_id]].trigger('new_message', {:content => @notification.content}).to_yaml
      
    else
      @user = User.find(params[:notification][:recipient_id])
      render '/'
    end
  end


end
