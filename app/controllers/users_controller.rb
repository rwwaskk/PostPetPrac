class UsersController < ApplicationController

	def feed
	    @micropost = current_user.microposts.build(params[:micropost])
	    
		#@micropost = current_user.microposts.new#build(params[:micropost])
		@microposts=current_user.feed
		@notifications = current_user.received_notifications
		@microcomment = @micropost.microcomments.build(params[:microcomment]) do |c|
    	c.user=current_user
    	end
		
	end


	def new
		@user = User.new
		@user.albums.build
   		 respond_to do |format|
      	 	format.html # new.html.erb
      		format.json { render json: @user }
     	 end
    end
    
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts
		@micropost=Micropost.new
		@microcomment=Microcomment.new
		@notifications = current_user.received_notifications
		@count=@notifications.count
	end

	def update
		@user=User.find_by_id(params[:id])
		@user.update_attributes(params[:user])
		if @user.save!
		flash[:success]="changes saved!"
		end
		redirect_to user_path(@user)
	end



	def following
    	@title = "Following"
    	@user = User.find(params[:id])
   	    @users = @user.followed_users
    	render 'show_follow'
  	end
  
  
	def followers
    	@title = "Followers"
    	@user = User.find(params[:id])
    	@users = @user.followers
    	@notifications = current_user.received_notifications
    	render 'show_follow'
  end


end
