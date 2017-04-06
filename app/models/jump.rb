class Jump < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  validates_presence_of :user_id, :location_id, :kind, :height
end
