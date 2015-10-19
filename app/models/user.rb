class User < ActiveRecord::Base
  has_many :shouts
  include Clearance::User
end
