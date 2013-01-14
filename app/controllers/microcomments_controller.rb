class MicrocommentsController < ApplicationController

  def destroy
   @user=current_user
   @microcomment=Microcomment.find_by_id(params[:id])
   if @microcomment.destroy
   flash[:success] = "comment deleted!"
      	  	respond_to do |format|
     		format.html 
      		format.json 
      		format.js   { render :layout => false }
   			end 
    
    
    
      	end
   end
   
def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @micropost }
    end
end

def create
    @micropost=Micropost.find_by_id(params[:micropost_id])
    @microcomment = @micropost.build(params[:microcomment])
    if @microcomment.save
      flash[:success] = "comment created!"
      redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end
  end
end
