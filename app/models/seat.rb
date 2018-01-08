class Seat < ApplicationRecord
	has_many :features
	belongs_to :flight
end
