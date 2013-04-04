class Picture < ActiveRecord::Base
  mount_uploader :name, PictureUploader
  attr_accessible :name
  belongs_to :page
end
