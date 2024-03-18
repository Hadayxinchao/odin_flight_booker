module FormFields
  class BookingPassengersController < ApplicationController
    def new
      booking = Booking.new
      booking.passengers.build

      helpers.form_for(booking) do |form| # 4
        form.fields_for :passengers, child_index: params[:index] do |passenger_form|
          render partial: "bookings/passenger_fields", locals: { passenger_form: passenger_form, index: params[:index].to_i }
        end
      end
    end
  end
end