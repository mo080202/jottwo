class JotsController < ApplicationController
  def index
    @jots = Jot.all
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
  def destroy
    jot = Jot.find(params[:id])
    jot.destroy
    redirect_to jots_path
  end
  private
  def jot_params
    params.require(:jot).permit(:content).merge(user_id: session[:user_id])
  end
end
