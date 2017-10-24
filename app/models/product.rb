# https://stackoverflow.com/questions/4441882/validating-min-and-max-length-of-a-string-but-allowing-it-to-be-blank

class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format:
      { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image!'}
  validates_length_of :title, minimum:10, :maximum => 200
end
