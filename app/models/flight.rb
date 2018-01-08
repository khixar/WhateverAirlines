class Flight < ApplicationRecord
	belongs_to :user, optional: true
	has_many :itineraries
	has_many :seats
end
