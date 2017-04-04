class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Successfully created account!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = 'Make sure all forms are filled in properly'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end