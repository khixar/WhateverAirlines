class User < ApplicationRecord
	has_many :flights

	#validates :role, presence: true
	#validates :username, presence: true 
	#validates :password, presence: true
end
