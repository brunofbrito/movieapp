class MoviesController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  def index
    @now_playing = Tmdb::Movie.now_playing
    if params[:search]
      @results = Tmdb::Movie.find(params[:search])
    end
    followees_ids = current_user.followees(User).map(&:id)
        #get only the ids of the people current_user folllows
        followees_ids << current_user.id
    @personal_activities = PublicActivity::Activity.where(owner_id: followees_ids, owner_type: "User").order('created_at DESC').limit(20)
    @world_activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end

  def show
    if params[:search]
      @results = Tmdb::Movie.find(params[:search])
    end
    @movie = Movie.new(Tmdb::Movie.detail(params[:id]))
    @cast = Tmdb::Movie.casts(@movie.id).map {|actor| actor["name"] }
    @shout = Shout.new
    @own_shout = Shout.where(movie_id: @movie.id, user_id: current_user.id)
    @shouts = Shout.where(movie_id: params[:id])
    url = "http://api.traileraddict.com/?imdb=#{@movie.imdb_id.delete("^0-9")}&count=4&width=000"
    doc = Nokogiri::HTML(open(url))
    @trailer = doc.at_css("trailer_id").text unless doc.at_css("trailer_id") == nil
  end
end
