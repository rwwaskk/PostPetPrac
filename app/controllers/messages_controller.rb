class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  
  def show
  @notifications = current_user.received_notifications
  @message = Message.find_by_id(params[:id])
  end
  def new
  
  @notifications = current_user.received_notifications
  end
  
  def index
    @incoming_messages = current_user.received_messages
    @outgoing_messages = current_user.sent_messages
    @notifications = current_user.received_notifications
  end
  
  def create
    message = Message.new(params[:message])
    message.sender_id = current_user.id
    if message.save
      flash[:notice] = "you created a message"
      redirect_to messages_path
	else
	  redirect_to messages_path
    end
  end
  
  def destroy
	@message=Message.find_by_id(params[:id])
   	if @message.destroy
		flash[:success] = "message deleted!"
    end
        respond_to do |format|
     		format.html { redirect_to messages_path }
      		format.json 
      		format.js   { render :layout => false }
   		end
	end
  
  
  def reply
    @notifications = current_user.received_notifications
	@reply = Message.find(params[:id])
	@id=params[:id]
	@reply.subject="re:"+@reply.subject
	render 'edit'
  end
  
  
  def edit
  	@notifications = current_user.received_notifications
  end
  
  def update

		@message = Message.find(params[:id])
		@message.update_attributes(params[:message])
		if @message.save!
			flash[:success]="changes saved!"
		end
		redirect_to messages_path
  end
  
end
