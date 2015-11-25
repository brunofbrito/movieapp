require 'ostruct'

class Movie
  include ActiveModel::Model
  delegate :id, :title, :poster_path, :backdrop_path, :release_date, :overview, :runtime,
    :tagline, :vote_average, :imdb_id, to: :movie_data

  def initialize(movie_data)
    @movie_data = OpenStruct.new(movie_data)
  end

  private

  attr_reader :movie_data
end
