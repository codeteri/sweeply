class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = Listing.all
    @categories = [["Select", ""], ["Job", "Job"], ["Service", "Service"]]
    if params[:suburb].present? && params[:category] != ""
      @listings = @listings.where(category: params[:category], suburb: params[:suburb])
    else
      if params[:suburb].present?
        @listings = @listings.where(suburb: params[:suburb])
      elsif params[:category].present?
        if params[:category] == ""
          @listings
        else
          @listings = @listings.where(category: params[:category])
        end
      end
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @bookings = @listing.bookings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to root_path, notice: 'Listing was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:listing).permit(:title, :rate, :suburb, :description, :category, :photo)
  end
end
