class ShoutsController < ApplicationController

  def create
    @shout = Shout.create(shout_params)
    redirect_to movie_path(id: params[:movie_id])
  end

  private

  def shout_params
    params.require(:shout).permit(:shout, :user_id).merge({
      user: current_user,
      movie_id: params[:movie_id]
    })
  end
end
