class Comment < ActiveRecord::Base
  belongs_to :floorplan
  belongs_to :user
end
