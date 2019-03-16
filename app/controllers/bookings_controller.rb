class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

    def booking_params
    params.require(:booking).permit(:checkin_on, :checkout_on)
  end
end
