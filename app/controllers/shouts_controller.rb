class ShoutsController < ApplicationController

  def create
    @movie = Tmdb::Movie.detail(286217)["id"]
    @shout = Shout.create(shout_params)
    @shout.movie_id = @movie
    @shout.user_id = current_user.id
    @shout.save
    redirect_to movie_path(@movie)
  end

  private

  def shout_params
    params.require(:shout).permit(:shout, :movie_id, :user_id)
  end

end