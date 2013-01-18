class BoxController < ApplicationController
def index
@incomings=current_user.incomings
@notifications = current_user.received_notifications
@count =Incoming.where(:unread=>true,:user_id=>current_user.id).count

end

def unread
@notifications = current_user.received_notifications
@unreads = Incoming.where(:unread=>true,:user_id=>current_user.id)

end

end
