class BoxController < ApplicationController
def index
@incomings=current_user.incomings
@count =Incoming.where(:unread=>true,:user_id=>current_user.id).count

end

def unread
@unreads = Incoming.where(:unread=>true,:user_id=>current_user.id)

end

end
