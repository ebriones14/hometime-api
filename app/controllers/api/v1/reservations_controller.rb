class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:update]

  def index
    render json: Reservation.all
  end

  def create
    reservation, error_messages = ReservationService.create(reservation_params)

    if error_messages.present?
      render json: { message: error_messages }, status: 400
    else
      render json: { message: "Reservation succesfully created for #{reservation.guest.full_name}"}, status: 201
    end
  end

  def update
    if @reservation.present?
      res, error_messages = ReservationService.update(@reservation, reservation_params)

      if error_messages.present?
        render json: { message: error_messages }, status: 400
      else
        render json: { message: "Reservation for #{res.guest.full_name} was succesfully updated." }, status: 200
      end
    else
      render json: { message: "Reservation not found." }, status: 404
    end
  end

  private
    def set_reservation
      code = reservation_params[:reservation_code] || reservation_params[:reservation][:code]
      p "CODE: #{code}"
      @reservation = Reservation.find_by_code(code)
    end

    def reservation_params
      if params[:reservation_code].present?
        params.permit(
          :reservation_code,
          :start_date,
          :end_date,
          :nights,
          :guests,
          :adults,
          :children,
          :infants,
          :status,
          :first_name,
          :last_name,
          :phone,
          :email,
          :currency,
          :payout_price,
          :security_price,
          :total_price,
          guest: [:first_name, :last_name, :phone, :email]
        )
      else
        params.permit(
          reservation: [
            :code,
            :start_date,
            :end_date,
            :expected_payout_amount,
            :listing_security_price_accurate,
            :host_currency,
            :nights,
            :number_of_guests,
            :status_type,
            :total_paid_amount_accurate,
            :guest_email,
            :guest_first_name,
            :guest_last_name,
            :guest_phone_numbers => [],
            guest_details: [:localized_description, :number_of_adults, :number_of_children, :number_of_infants]
          ]
        )
      end
      
    end
end
