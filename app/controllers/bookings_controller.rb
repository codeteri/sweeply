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
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to profile_path(@user)
    else
      render :new, status: :unprocessable_entity
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
    params.require(:booking).permit(:title, :rate, :suburb, :description, :category)
  end
end
