class PassengerMailer < ApplicationMailer
  default from: email_address_with_name('notification@flight_booker.com', 'Booking Confirmation')

  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @url = 'http://example.com/bookings'
    mail(
      to: email_address_with_name(@passenger.email, @passenger.name),
      subject: 'Booking Confirmation'
    )
  end
end
