class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photos = Photo.where(concert_id: params[:id])
    @concert = Concert.where(concert_id: params[:id])
    @venue = Venue.where(concert_id: params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    # @photo.user_id << current_user
    @photo.concert_id = Concert.find(params[:concert_id]).id
    
    respond_to do |format|
      if @photo.save
        format.html { redirect_to user_concerts_path(current_user), notice: 'Photo was successfully added.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def photo_params
    params.require(:photo).permit(:photo,:concert_id,:user_id)
  end
end