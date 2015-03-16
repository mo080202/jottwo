class JotsController < ApplicationController
  def index
    @jots = Jot.all
  end
  def show
    @jot = Jot.find(params[:id])
  end
  def new
    @jot = Jot.new
  end
  def create
    Jot.create(jot_params)
    redirect_to jots_path
  end
  def edit
    @jot = Jot.find(params[:id])
  end
  def update
    jot = Jot.find(params[:id])
    jot.update!(jot_params)
    redirect_to jots_path
  end
  def like
    jot = Jot.find(params[:id])
    jot.likes.create!(user_id: current_user.id)
    redirect_to jot_path(jot)
  end
  def unlike
    jot = Jot.find(params[:id])
    jot.likes.where(user_id: current_user.id).delete_all
    redirect_to jot_path(jot)
  end
  def destroy
    jot = Jot.find(params[:id])
    jot.destroy
    redirect_to jots_path
  end
  private
  def jot_params
    params.require(:jot).permit(:content, :photo).merge(user_id: session[:user_id])
  end
  def has_not_liked?(jot)
    jot.likes.where(user_id: current_user.id).empty?
  end
  helper_method :has_not_liked?
end
