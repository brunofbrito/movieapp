class MoviesController < ApplicationController

  def index
    @now_playing = Tmdb::Movie.now_playing
    if params[:search]
      @results = Tmdb::Movie.find(params[:search])
    else
    end
  end

  def show 
    @movie = Tmdb::Movie.detail(params[:id])
    @shout = Shout.new
    @shouts = Shout.where(movie_id: params[:id])
  end

end
