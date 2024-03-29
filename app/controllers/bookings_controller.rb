class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    @flight = Flight.find(params[:selected_flight])
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger| 
        PassengerMailer.with(booking: @booking, passenger: passenger).confirmation_email.deliver_later
      end
      redirect_to booking_path(@booking), notice: 'Booking successfully saved.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find([params[:id]]).first
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :selected_flight, passengers_attributes: %i[name email _destroy])
  end
end
