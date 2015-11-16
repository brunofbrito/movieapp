class MoviesController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  def index
    @now_playing = Tmdb::Movie.now_playing
    if params[:search]
      @results = Tmdb::Movie.find(params[:search])
    end
  end

  def show
    if params[:search]
      @results = Tmdb::Movie.find(params[:search])
    end
    @movie = Movie.new(Tmdb::Movie.detail(params[:id]))
    @shout = Shout.new
    @own_shout = Shout.where(movie_id: @movie.id, user_id: current_user.id)
    @shouts = Shout.where(movie_id: params[:id])
    url = "http://api.traileraddict.com/?imdb=#{@movie.imdb_id.delete("^0-9")}&count=4&width=000"
    doc = Nokogiri::HTML(open(url))
    @trailer = doc.at_css("trailer_id").text unless doc.at_css("trailer_id") == nil
  end
end
