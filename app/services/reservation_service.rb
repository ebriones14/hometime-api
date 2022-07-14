module ReservationService

	def self.create(params)
		if params[:reservation_code].present?
			CompanyOne::Booking.create(params)
		elsif params[:reservation].present?
			CompanyTwo::Booking.create(params)
		end
	end

	def self.update(reservation, params)
		if params[:reservation_code].present?
			CompanyOne::Booking.update(reservation, params)
		elsif params[:reservation].present?
			CompanyTwo::Booking.update(reservation, params)
		end
	end

end