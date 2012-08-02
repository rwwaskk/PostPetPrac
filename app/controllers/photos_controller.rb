class PhotosController < ApplicationController

def new
@photo = Photo.new
end
def show
@photo=Photo.find_by_id(params[:id])
end


def create
    
	@photo = @album.photos.build(params[:album])
    @photo.save!
end


def index
@photos=Photo.all
end
end
