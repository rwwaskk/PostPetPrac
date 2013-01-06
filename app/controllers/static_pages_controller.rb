class StaticPagesController < ApplicationController
  def home
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
