class User < ActiveRecord::Base
  has_many :shouts
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  acts_as_follower
  acts_as_followable
end
