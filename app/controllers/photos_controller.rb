class PhotosController < ApplicationController

def new
@photo = Photo.new
end
def edit
@photo=Photo.find_by_id(params[:id])
end
def update
@photo=Photo.find_by_id(params[:id])
@photo.update_attributes(params[:photo])
if @photo.save!
      	flash[:success] = "description updated!"
      redirect_to photo_path(@photo)
    else
      redirect_to photo_path(@photo)
    end
end


def show

@album=Album.find_by_id(params[:album_id])
id = params[:id].to_i
@photo=Photo.find_by_id(params[:id])
@album=Album.find_by_id(@photo.album_id)
@first=false
@last=false
if @album.photos[0]==@photo
    @first=true
end

if @album.photos[@album.photos.count-1]==@photo
    @last=true
end
pre_id=id-1
next_id=id+1
@pre=Photo.find_by_id(pre_id)

@next=Photo.find_by_id(next_id)



end


def create
    
	@photo = @album.photos.build(params[:album])
    @photo.save!
end


def index
@photos=Photo.all
end
end
