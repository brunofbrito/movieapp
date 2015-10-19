class Movie < ActiveRecord::Base
  has_many :shouts
end
