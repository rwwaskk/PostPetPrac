class MicropostsController < ApplicationController

	before_filter :set_notifications
	def set_notifications
  		@notifications = current_user.received_notifications
	end

	def destroy
		@microposts=current_user.microposts
		@user=current_user
		@micropost=Micropost.find_by_id(params[:id])
   		if @micropost.destroy
   			flash[:success] = "post deleted!"
        end
        respond_to do |format|
     		format.html { redirect_to users_path }
      		format.json 
      		format.js   { render :layout => false }
   		end
    
	end
   
   
	def edit
		@micropost=Micropost.find_by_id(params[:id])
	end


	def update
		@user=current_user
		@micropost=Micropost.find_by_id(params[:id])
		@micropost.update_attributes(params[:micropost])
		if @micropost.save!
			flash[:success]="changes saved!"
		end
		redirect_to microposts_path
	end
	
	def new
 		@micropost = current_user.microposts.build(params[:micropost])
 	    respond_to do |format|
  	    format.html # new.html.erb
  	    format.json { render json: @user }
    	end
	end

	def create
		#@microposts=current_user.microposts
		@microposts=current_user.feed
		@micropost = current_user.microposts.new(params[:micropost])
		@microcomment = Microcomment.new
		
		
    	@user=current_user
    	if @micropost.save
      		flash[:success] = "post created!"
      		#@micropost=current_user.microposts.new
      		respond_to do |format|
     		format.html {redirect_to 'users/feed'}
      		format.json 
      		format.js   
   			end
      	else
     	 	render 'static_pages/home'
    	end
	end
  
	def show
		@user=current_user
		@micropost=Micropost.find_by_id(params[:id])
   		@microcomment = @micropost.microcomments.build(params[:microcomment])
   	  		respond_to do |format|
     		format.html 
      		format.json 
      		format.js   { render :layout => false }
   			end
	end
  
	def add_comment
  		@micropost=Micropost.find_by_id(params[:id])
  		@notification = Notification.new(params[:notification])
    	@microcomment = @micropost.microcomments.build(params[:microcomment]) do |c|
    	c.user=current_user
    	end
  	
  			if @microcomment.save! && @notification.save!
  				@notifications = current_user.received_notifications
  				@count=@notifications.count
  				Pusher['private-'+params[:notification][:recipient_id]].trigger('new_message', {:count => @count,:content=> 'test'})
      			
            
  				flash[:success] = "comments created!"
        		respond_to do |format|
     			format.html {redirect_to 'users/feed'}
      			format.json 
      			format.js   
   				end
   			
   		 	else
  				render 'static_pages/home'
  			end
		end
	end