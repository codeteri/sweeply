class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy accept]

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
      redirect_to profile_path, alert: 'Booking was successfully created.'
    else
      puts "Booking errors: #{@booking.errors.full_messages}"
      puts "Booking params: #{booking_params}"
      redirect_to profile_path, alert: @booking.errors.full_messages.to_sentence
    end
  end

  def accept
    @booking.confirmed!
    if @booking.save
      redirect_to profile_path, alert: 'Booking confirmed!'
    else
      puts "Booking errors: #{@booking.errors.full_messages}"
      puts "Booking params: #{booking_params}"
      redirect_to profile_path, alert: @booking.errors.full_messages.to_sentence
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    @booking.save
  end

  def destroy
    @booking.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:message, :date, :listing_id, :confirmed)
  end
end
