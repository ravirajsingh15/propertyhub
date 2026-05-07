class Property < ApplicationRecord
	require_relative "../uploaders/image_uploader"
	# validates :name, presence: true
	# validates :price, presence: true
	# validates :location, presence: true
	# validates :latitude, presence: true
	# validates :longitude, presence: true
	# validates :description, presence: true
	has_one_attached :image
	geocoded_by :location 
	after_validation :geocode, if: :will_save_change_to_location?

	belongs_to :user
	has_many :wishlists

	mount_uploader :image, ImageUploader
end
