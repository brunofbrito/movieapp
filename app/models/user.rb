class User < ActiveRecord::Base
  has_many :shouts
  acts_as_follower
  acts_as_followable
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
end
