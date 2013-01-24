class StaticPagesController < ApplicationController
  

  before_filter :set_notifications
  def set_notifications
  		@notifications = current_user.received_notifications
	end


  def home
 	# @notifications = current_user.received_notifications
  	 if signed_in?
     @micropost = current_user.microposts.build
     @feed_items = current_user.feed
   	 else
	end
end
  
  
  
  
  def welcome
  redirect_to :action=>'home'
  end
  

  def help
  end
end
