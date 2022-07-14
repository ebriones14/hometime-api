class Guest < ApplicationRecord

	has_many :reservations

	validates :email, uniqueness: true

	serialize :phone_numbers, Array


	def full_name
		"#{last_name}, #{first_name}"
	end
end
