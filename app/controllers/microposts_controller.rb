class MicropostsController < ApplicationController
def new
@micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    end
    
    
    
    def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "post created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end
end
