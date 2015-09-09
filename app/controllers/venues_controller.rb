class VenuesController < ApplicationController

  def index
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to concerts_path, notice: "Venue has been created!"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  protected

  def venue_params
    params.require(:venue).permit(:name, :city, :country, :concert_id)
  end
end
