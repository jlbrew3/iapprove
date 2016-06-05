class Floorplan < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :project_id, :presence => true

  has_many :comments
  belongs_to :project
end
