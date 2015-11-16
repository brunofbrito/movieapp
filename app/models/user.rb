class User < ActiveRecord::Base
  has_many :shouts
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
end
