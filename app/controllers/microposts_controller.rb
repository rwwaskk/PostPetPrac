class MicropostsController < ApplicationController

def index
@micropost=current_user.microposts.new
@microposts=current_user.microposts
	render "users/feed"
end



   
   def destroy
    @microposts=current_user.microposts
   @user=current_user
   @micropost=Micropost.find_by_id(params[:id])
   if @micropost.destroy
   flash[:success] = "post deleted!"
      	render "users/feed"
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
	    @microposts=current_user.microposts
    	@micropost = current_user.microposts.build(params[:micropost])
    	@user=current_user
    	if @micropost.save
      	flash[:success] = "post created!"
      	render "users/feed"
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