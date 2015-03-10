class SessionsController < ApplicationController
  def show; end
  def create
    user = User.find_by(email: params[:email])
    if user
      log_in user
      redirect_to jots_path
    else
      render 'show'
    end
  end
  
end
