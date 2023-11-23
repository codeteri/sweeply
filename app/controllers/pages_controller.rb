class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @bookings = current_user.bookings
    @listings = current_user.listings
  end

  def edit
    @user = current_user
  end

  def update
  @user = current_user
  if @user.update(user_params)
    redirect_to profile_path, notice: 'User was successfully updated.'
  else
    render :edit
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_number, :bio)
  end
end
