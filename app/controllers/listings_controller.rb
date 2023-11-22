class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @bookings = @listing.bookings
  end

  def edit
  end

  def update
    @listing.update(listing_params)
  end

  def destroy
    @listing.delete
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :rate, :suburb, :description, :type)
  end
end
