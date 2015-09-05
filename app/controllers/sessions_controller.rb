class SessionsController < ApplicationController
  
  #renders login page
  def new
    # redirect_to concerts_path if current_user
    # @user = User.find(session[:user_id])
    # binding.pry

    # if @user && @user.authenticate(params[:password])

    #   redirect_to concerts_path, notice: "Welcome back, #{@user.firstname}!"
    # else
    #   flash.now[:alert] = "Log in failed..."
      render :new
    # end
  end


  # creating a session on user login/signup... validating by email
  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to concerts_path, notice: "Welcome, #{@user.username}!"
    else
      render :new, alert: "Log in failed..."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to concerts_path, notice: "See you again soon ..."
  end

end
