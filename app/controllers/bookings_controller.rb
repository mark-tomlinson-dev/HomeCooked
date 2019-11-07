class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  

  def index
    @bookings = current_user.bookings.all
  end

  def show
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @booking.listing.title,
            description: @booking.listing.description,
            amount: @booking.listing.price * 100,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                booking_id: @booking.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&bookingId=#{@booking.id}",
        cancel_url: "#{root_url}bookings"
    )

    @session_id = session.id
  end

  def new
    if current_user.is_host == true
      redirect_to root_path, notice: "No need to reserve a seat, you are the host of this event!"
    else
      @listing = Listing.find(params[:listing])
      @booking = @listing.bookings.new(user: current_user)
    end
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
