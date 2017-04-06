class Location < ActiveRecord::Base
  has_many :jumps
  has_many :users, through: :jumps
  validates_presence_of :name, :address

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect{|item| item.slug == slug}
  end
end
