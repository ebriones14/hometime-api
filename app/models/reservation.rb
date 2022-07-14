class Reservation < ApplicationRecord
  belongs_to :guest

  validates :code, uniqueness: true

  enum status: [:accepted, :declined]
end
