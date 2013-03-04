class EventsController < ApplicationController

	before_filter :set_notifications
		def set_notifications
  			@notifications = current_user.received_notifications
		end
	
	
		def index
		@events=Event.all
		end
	
		def create
		
		@event = current_user.events.new(params[:event])
		
		if @event.save
      		flash[:success] = "post created!"
      		
      		respond_to do |format|
     		format.html {redirect_to '/events'}
      		format.json 
      		format.js   
   			end
      	else
     	 	render 'static_pages/home'
    	end
    	end
    	
    	def show
    		@event=Event.find(params[:id])
    		2.times{@event.photos.build}
		end
		
		def update
			@event=Event.find(params[:id])
			@event.update_attributes(params[:event])
			if @event.save!
      			flash[:success] = "album updated!"
      			redirect_to event_path(@event)
   				 else
     		 redirect_to event_path(@event)
    		end
		end

    
		
		
end
