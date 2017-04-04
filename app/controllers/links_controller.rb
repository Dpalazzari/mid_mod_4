class LinksController < ApplicationController

  def index
    if current_user
      render :index
    else
      flash[:danger] = "You must Log in first!"
      redirect_to new_user_path
    end
  end

end
