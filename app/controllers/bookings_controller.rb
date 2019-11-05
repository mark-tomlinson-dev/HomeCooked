class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  def index
    @bookings = current_user.bookings.all
  end

  def show
  end

  def new
    @listing = Listing.find(params[:listing])
    @booking = @listing.bookings.new(user: current_user)
  end

  def edit   
  end

  # Create new booking and redirect to that specific booking
  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking, notice: "Booking created successfully!"
    else
      render :new 
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Booking was successfully updated!"
    else
      render :edit, alert: "Your booking wasn't updated"
    end 
  end 

  def destroy
    @booking.destroy

    redirect_to bookings_path, notice: "Your booking was deleted"
  end 

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end 

  def booking_params
    params.require(:booking).permit(:user_id, :listing_id, :is_paid, :number_of_guests)
  end
end
