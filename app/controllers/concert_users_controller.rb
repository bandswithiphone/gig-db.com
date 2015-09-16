class ConcertUsersController < ApplicationController

  def new
    @concertusers = ConcertUser.all
  end

  def update
    @concert = Concert.find(params[:concert_id])
    @concert.users << current_user 
  end

  def show
    @concertusers = ConcertUser.all
    @concert = Concert.find(params[:concert_id])
    @concert.users << current_user 
    redirect_to user_path(params[:id])
  end

  def destroy
  end

end