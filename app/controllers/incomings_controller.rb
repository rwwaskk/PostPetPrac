class IncomingsController < ApplicationController


def show

@incoming=Incoming.find(params[:id])
@incoming.unread=false
@incoming.save!
end


def destroy
 @user=current_user
   @incoming=Incoming.find_by_id(params[:id])
   if @incoming.destroy
   flash[:success] = "incoming deleted!"
      	redirect_to user_path(@user)
      	end
end



def reply

@outgoing = Incoming.find(params[:id])
@outgoing.title="re:"+@outgoing.title
redirect_to edit_outgoing_path(@outgoing)

end



end
