class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  
  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def edit   
  end


  # Create new listing and redirect to that specific listing
  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing, notice: "Event created successfully!"
    else
      render :new 
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Event was successfully updated!"
    else
      render :edit, alert: "Your event wasn't updated"
    end 
  end 

  def destroy
    @listing.destroy

    redirect_to listings_path, notice: "Your event was deleted"
  end 

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end 

  def listing_params
    params.require(:listing).permit(:title, :description, :date, :max_guests, :price, :user_id)
  end

end
