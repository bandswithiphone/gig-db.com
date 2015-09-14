class ConcertUsersController < ApplicationController

  def update
    @concert = Concert.find(params[:concert_id])
    @concert.users << current_user 
  end

  def destroy
  end
end