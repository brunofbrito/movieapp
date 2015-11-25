class Shout < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end
