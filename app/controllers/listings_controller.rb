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


  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end


  private

  def set_listing
    @listing = Listing.find(params[:id])
  end 

  def listing_params
    params.require(:listing).permit(:title, :description, :date, :max_guests, :price, :user_id)
  end

end
