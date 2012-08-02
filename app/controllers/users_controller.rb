class UsersController < ApplicationController




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
    render 'show_follow'
  end


end
