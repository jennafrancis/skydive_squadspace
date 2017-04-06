class User < ActiveRecord::Base
  has_many :jumps
  has_many :locations, through: :jumps
  has_secure_password
  validates_presence_of :username, :email, :password
end
