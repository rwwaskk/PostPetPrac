class OutgoingsController < ApplicationController
def edit
@incoming=Incoming.find(params[:id])
@outgoing=Outgoing.new
@outgoing.title="re:"+@incoming.title
@outgoing.content=@incoming.content
@outgoing.to_id=@incoming.from_id
end

def update
@outgoing = Outgoing.find(params[:id])

@outgoing=current_user.outgoings.build(:title=>@outgoing.title,:content=>@outgoing.content)
@user=current_user
    	if @outgoing.save
    	
    	
      	flash[:success] = "outgoing created!"
      	redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end


end


def new
	@outgoing = current_user.outgoings.build(params[:outgoing])
	@outgoing.to_id=User.find(params[:to_id])
   
    	respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @user }
    	end
end

def create
	@outgoing = current_user.outgoings.build(params[:outgoing])
	@user=current_user
    	if @outgoing.save
    	@to_user = User.find(@outgoing.to_id)
    	@to_user.incomings.build(:title=>@outgoing.title,:content=>@outgoing.content, :from_id=>current_user.id,:unread=>true)
    	@to_user.save!
      	flash[:success] = "your message is sent to "+@to_user.name
      	redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
end
def show
@outgoing=Outgoing.find(params[:id])
end

def destroy
 @user=current_user
   @outgoing=Outgoing.find_by_id(params[:id])
   if @outgoing.destroy
   flash[:success] = "outgoing deleted!"
      		redirect_to :controller=>'box',:action=>'index'
      	end
end


end