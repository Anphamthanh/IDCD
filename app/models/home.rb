class Home < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :picture, :title
end
