class Photo < ActiveRecord::Base

	belongs_to :gallery

	validates :gallery, presence: true

  mount_uploader :image, PhotoUploader
end
