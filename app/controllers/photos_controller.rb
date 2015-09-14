class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user << current_user
    # @photo.user_id << current_user
    @photo.concert << Concert.id
    
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

end

  private
  
  def photo_params
    params.require(:photo).permit(:photo,:concert_id,:user_id)
  end

