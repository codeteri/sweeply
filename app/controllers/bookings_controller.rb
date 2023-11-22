class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)

    if @booking.save
      redirect_to profile_path(current_user), alert: 'Booking was successfully created.'
    else
      puts "Booking errors: #{@booking.errors.full_messages}"
      puts "Booking params: #{booking_params}"
      redirect_to profile_path(current_user), alert: @booking.errors.full_messages.to_sentence
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.delete
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:message, :date, :listing_id)
  end
end
