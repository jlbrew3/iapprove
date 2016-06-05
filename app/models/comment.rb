class Comment < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :floorplan_id, :presence => true
  validates :comment, :presence => true

  belongs_to :floorplan
  belongs_to :user
end
