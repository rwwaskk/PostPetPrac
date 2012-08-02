class AlbumsController < ApplicationController
def show
@album=Album.find_by_id(params[:id])

end


def new
@album = Album.new
2.times{@album.photos.build}


end
def edit
@album=Album.find_by_id(params[:id])
2.times {@album.photos.build}
end

def create
    @user=current_user
	@album = @user.albums.build(params[:album])
    	@user=current_user
    	if @album.save
      	flash[:success] = "album created!"
      	redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end

end

def update

@album=Album.find_by_id(params[:id])
@album.photos.build(params[:album])
if @album.save!
flash[:success]="changes saved!"
end
redirect_to album_path(@album)
end




def index
@albums=Album.all
end
end
