class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.name}."
      redirect_to root_path
    else
      flash[:danger] = "Login Failed"
      redirect_to login_path
    end
  end

end