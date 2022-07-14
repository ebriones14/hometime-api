module CompanyTwo
	class Booking < Base

		attr_accessor :code,
									:start_date,
									:end_date,
									:expected_payout_amount,
									:guest_email,
									:guest_first_name,
									:guest_last_name,
									:listing_security_price_accurate,
									:host_currency,
    							:nights,
    							:number_of_guests,
    							:status_type,
    							:total_paid_amount_accurate,
    							:guest_phone_numbers


    def self.create(params)
  		booking	= Booking.new(params[:reservation])
  		gd 			= GuestDetails.new(params[:reservation][:guest_details])

    	guest = Guest.find_or_create_by(email: booking.guest_email)

    	if guest.first_name.nil?
    		guest.first_name 		= booking.guest_first_name
    		guest.last_name 		= booking.guest_last_name

	    	booking.guest_phone_numbers.each do |gpn|
	    		guest.phone_numbers << gpn
	    	end

	    	guest.save
    	end
    	
    	reservation = guest.reservations.build(
    		code: booking.code,
    		start_date: booking.start_date,
    		end_date: booking.end_date,
    		nights: booking.nights,
    		guests: booking.number_of_guests,
    		status: booking.status_type,
    		currency: booking.host_currency,
    		payout_price: booking.expected_payout_amount,
    		security_price: booking.host_currency,
    		total_price: booking.total_paid_amount_accurate,
    		adults: gd.number_of_adults,
    		children: gd.number_of_children,
    		infants: gd.number_of_infants
    	)

    	if reservation.save
    		return [reservation]
    	else
	    	return [reservation, reservation.errors.full_messages]
	    end
    end

    def self.update(reservation, params)
    	booking	= Booking.new(params[:reservation])
  		gd 			= GuestDetails.new(params[:reservation][:guest_details])
  		guest 	= reservation.guest

    	reservation.update(
				code: booking.code,
				start_date: booking.start_date,
				end_date: booking.end_date,
				nights: booking.nights,
				guests: booking.number_of_guests,
				status: booking.status_type,
				currency: booking.host_currency,
				payout_price: booking.expected_payout_amount,
				security_price: booking.host_currency,
				total_price: booking.total_paid_amount_accurate,
				adults: gd.number_of_adults,
				children: gd.number_of_children,
				infants: gd.number_of_infants
			)

			guest.update(
				first_name: booking.guest_first_name,
				last_name: booking.guest_last_name
			)

			return [reservation, reservation.errors.full_messages]
    end

	end
end