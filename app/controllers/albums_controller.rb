class AlbumsController < ApplicationController
def show
@album=Album.find_by_id(params[:id])

@user=current_user

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
      redirect_to album_path(@album)
    else
      redirect_to album_path(@album)
    end

end

def update

@album=Album.find_by_id(params[:id])
@album.update_attributes(params[:album])
if @album.save!
      	flash[:success] = "album updated!"
      redirect_to album_path(@album)
    else
      redirect_to album_path(@album)
    end
end




def index
@albums=Album.all
end
end
