class Project < ActiveRecord::Base
  has_many :ownerships
  has_many :floorplans
  has_many :users, :through => :ownerships
end
