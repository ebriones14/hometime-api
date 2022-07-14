# README


* Ruby 2.5.8

* Rails 6.1.6.1

* Database: Posgresql

Steps to setup the project

* Clone project

* Run bundle install

* Run rails db:create db:migrate

* Run rails s

To check all Reservations, send GET request to: localhost:3000/api/v1/reservations

To create a Reservation, send POST request to: localhost:3000/api/v1/reservations

Sample payload 1

{
"reservation_code": "YYY12345678",
"start_date": "2021-04-14",
"end_date": "2021-04-18",
"nights": 4,
"guests": 4,
"adults": 2,
"children": 2,
"infants": 0,
"status": "accepted",
"guest": {
"first_name": "Wayne",
"last_name": "Woodbridge",
"phone": "639123456789",
"email": "wayne_woodbridge@bnb.com"
},
"currency": "AUD",
"payout_price": "4200.00",
"security_price": "500",
"total_price": "4700.00"
}

Sample payload 2

{
"reservation": {
"code": "XXX12345678",
"start_date": "2021-03-12",
"end_date": "2021-03-16",
"expected_payout_amount": "3800.00",
"guest_details": {
"localized_description": "4 guests",
"number_of_adults": 2,
"number_of_children": 2,
"number_of_infants": 0
},
"guest_email": "wayne_woodbridge@bnb.com",
"guest_first_name": "Wayne",
"guest_last_name": "Woodbridge",
"guest_phone_numbers": [
"639123456789",
"639123456789"
],
"listing_security_price_accurate": "500.00",
"host_currency": "AUD",
"nights": 4,
"number_of_guests": 4,
"status_type": "accepted",
"total_paid_amount_accurate": "4300.00"
}
}

To update a Reservation, send PATCH request to: localhost:3000/api/v1/reservations

Use the sample payloads above with different data (e.g., status, check-in/out dates, number of guests, etc.) to update a reservation. Keep in mind that the system will need the Reservation Code to find the reservation. 
