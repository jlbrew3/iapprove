class Floorplan < ActiveRecord::Base
  validates :project_id, :presence => true

  has_many :comments, :dependent => :destroy
  belongs_to :project

  mount_uploader :image, FloorplanUploader
end
