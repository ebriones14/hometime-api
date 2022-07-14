module CompanyOne
	class Booking < Base

		attr_accessor :reservation_code,
									:start_date,
									:end_date,
									:nights,
									:guests,
									:adults,
									:children,
									:infants,
									:status,
    							:currency,
    							:payout_price,
    							:security_price,
    							:total_price


    def self.create(params)
  		booking	= Booking.new(params)
  		gd 			= GuestDetails.new(params[:guest])
    		
    	guest = Guest.find_or_create_by(email: gd.email)

    	if guest.first_name.nil?
    		guest.first_name 		= gd.first_name
    		guest.last_name 		= gd.last_name
	    	guest.phone_numbers << gd.phone
	    	guest.save	
    	end
    	
    	reservation = guest.reservations.build(
    		code: booking.reservation_code,
    		start_date: booking.start_date,
    		end_date: booking.end_date,
    		nights: booking.nights,
    		guests: booking.guests,
    		adults: booking.adults,
    		children: booking.children,
    		infants: booking.infants,
    		status: booking.status,
    		currency: booking.currency,
    		payout_price: booking.payout_price,
    		security_price: booking.security_price,
    		total_price: booking.total_price
    	)

    	if reservation.save
    		return [reservation]
    	else
	    	return [reservation, reservation.errors.full_messages]
	    end
    end

    def self.update(reservation, params)
    	booking	= Booking.new(params)
  		gd 			= GuestDetails.new(params[:guest])
  		guest 	= reservation.guest

  		reservation.update(
    		code: booking.reservation_code,
    		start_date: booking.start_date,
    		end_date: booking.end_date,
    		nights: booking.nights,
    		guests: booking.guests,
    		adults: booking.adults,
    		children: booking.children,
    		infants: booking.infants,
    		status: booking.status,
    		currency: booking.currency,
    		payout_price: booking.payout_price,
    		security_price: booking.security_price,
    		total_price: booking.total_price
    	)

    	guest.update(
    		first_name: gd.first_name,
				last_name: gd.last_name
  		)

  		return [reservation, reservation.errors.full_messages]
    end

	end
end