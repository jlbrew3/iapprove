class Project < ActiveRecord::Base
  validates :project_name, :presence => true

  has_many :ownerships
  has_many :floorplans
  has_many :users, :through => :ownerships, :source => :user
end
