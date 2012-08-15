class BoxController < ApplicationController
def index
end

def unread
@unreads = Incoming.where(:unread=>true)
end

end
