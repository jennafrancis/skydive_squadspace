class User < ActiveRecord::Base
  has_many :jumps
  has_many :locations, through: :jumps
end
