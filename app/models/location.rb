class Location < ApplicationRecord
  validates :name, :address, :latitude, :longitude, presence: true
end
