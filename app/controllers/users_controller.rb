class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
  end

  def show 
    if current_user
      @concerts = Concert.all.joins(:venue)
      @concerts = @concerts.where(["artist LIKE ?", "%#{params[:artist]}%"]) unless params[:artist].blank?
      @concerts = @concerts.where(["venues.name LIKE ?", "%#{params[:name]}%"]) unless params[:name].blank?
      @concerts = @concerts.where(["venues.city LIKE ?", "%#{params[:city]}%"]) unless params[:city].blank?
      @concerts = @concerts.where(["venues.city LIKE ?", "%#{params[:country]}%"]) unless params[:country].blank?
      @concerts = @concerts.order(date: :desc).page(params[:page]).per(8)
    end
  end

  def new
    @user = User.new
  end

  def login
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      # UserMailer.welcome_email(@user).deliver_later

      # format.html { redirect_to(@user, notice: 'User was successfully created.') }
      # format.json { render json: @user, status: :created, location: @user }

      session[:user_id] = @user.id
      redirect_to concerts_path, notice: "Welcome aboard, #{@user.username}!"
    else
      # format.html { render action: 'new' }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  protected

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end