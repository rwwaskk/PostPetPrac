class UsersController < ApplicationController
def new
@user = User.new

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
    render 'show_follow'
  end


end
