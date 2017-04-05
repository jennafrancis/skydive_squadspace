class Location < ActiveRecord::Base
  has_many :jumps
  has_many :users, through: :jumps
end
