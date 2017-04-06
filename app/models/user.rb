class User < ActiveRecord::Base
  has_many :jumps
  has_many :locations, through: :jumps
  has_secure_password
  validates_presence_of :username, :email, :password

  def slug
    self.username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect{|item| item.slug == slug}
  end
end
