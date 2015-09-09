class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]

  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = Concert.all.joins(:venue)
    # @concerts = Concert.all.includes(:venue)
    @concerts = @concerts.where(artist: params[:artist]) unless params[:artist].blank?
    # @concerts = @concerts.where(date: params[:date]) if params[:date]
    @concerts = @concerts.where(venue: {name: params[:name]}) unless params[:name].blank?
    @concerts = @concerts.where(venue: {city: params[:city]}) unless params[:city].blank?
    @concerts = @concerts.where(venue: {country: params[:country]}) unless params[:country].blank?
    if current_user
      @concerts = current_user.concerts.order(date: :desc).page(params[:page]).per(10)
    else
      @concerts = @concerts.order(date: :desc).page(params[:page]).per(10)
    end
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    # @concert = Concert.joins(:venue)
    @concert = Concert.new
    @concert.venue = Venue.new
    @venues = Venue.all

  end

  # GET /concerts/1/edit
  def edit
    # @concert = Concert.joins(:venue)
    @concert = Concert.find(params[:id])
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)
    @concert.users << current_user

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params.require(:concert).permit(:artist,:date,:venue_id)
    end
end
