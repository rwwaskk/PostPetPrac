class MicropostsController < ApplicationController
   
   def destroy
   @user=current_user
   @micropost=Micropost.find_by_id(params[:id])
   if @micropost.destroy
   flash[:success] = "post deleted!"
      	redirect_to user_path(@user)
      	end
   end
   
  
	
	def new
 		@micropost = current_user.microposts.build(params[:micropost])

    	respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @user }
    	end
    end

	def create
    	@micropost = current_user.microposts.build(params[:micropost])
    	@user=current_user
    	if @micropost.save
      	flash[:success] = "post created!"
      	redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end
  end
  
  def show
    @user=current_user
	@micropost=Micropost.find_by_id(params[:id])
   	@microcomment = @micropost.microcomments.build(params[:microcomment])
   
   
   	
  end
  
  def add_comment
  	@micropost=Micropost.find_by_id(params[:id])
    @microcomment = @micropost.microcomments.build(params[:microcomment]) do |c|
     c.user=current_user
     end
  
    
 
  if @microcomment.save!
  		flash[:success] = "comments created!"
        redirect_to micropost_path(@micropost)
    else
  render 'static_pages/home'
  end
end
end