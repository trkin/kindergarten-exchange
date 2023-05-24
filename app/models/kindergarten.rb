class Kindergarten < ApplicationRecord
  geocoded_by :address

  has_many :wishes, dependent: :destroy
  has_many :wish_kindergartens, dependent: :destroy

  validates :name, :address, :latitude, :longitude, presence: true
end
