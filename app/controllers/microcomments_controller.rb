class MicrocommentsController < ApplicationController
def new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @micropost }
    end
end

def create
    @micropost=Micropost.find_by_id(params[:micropost])
    @microcomment = @micropost.build(params[:microcomment])

    if @microcomment.save
      flash[:success] = "comment created!"
      redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end
  end
end
