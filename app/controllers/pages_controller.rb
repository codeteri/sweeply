class PagesController < ApplicationController
  def home
  end

  def profile
    @user = User.find(params[:id])
    @bookings = current_user.bookings
    @listings = current_user.listings
  end

end
