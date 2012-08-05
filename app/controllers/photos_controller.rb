class PhotosController < ApplicationController


 def destroy
   @user=current_user
   @photo=Photo.find_by_id(params[:id])
   @album=@photo.album
   if @photo.destroy
   flash[:success] = "photo deleted!"
      	redirect_to album_path(@album)
      	end
   end

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
@microcomment = @photo.microcomments.build(params[:microcomment])
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

 def add_comment
  	@photo=Photo.find_by_id(params[:id])
    @microcomment = @photo.microcomments.build(params[:microcomment]) do |c|
     c.user=current_user
     end
  if @microcomment.save!
  		flash[:success] = "comments created!"
        redirect_to photo_path(@photo)
    else
  render 'static_pages/home'
  end
end

end
