class ProfilesController < ApplicationController
  def show
    @bookings = current_user.bookings
    @listings = current_user.listings
  end
end
