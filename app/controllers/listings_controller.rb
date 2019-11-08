class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  
  def index
    @listings = Listing.all
  end

  def show
    if current_user.profile == nil
      redirect_to new_profile_path
    end
  end

  def new
    # Authorise only hosts to create events
    if current_user.is_host == false
      redirect_to root_path, notice: "I'm sorry, only hosts can create events!"
    else 
      @listing = Listing.new
    end
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
    # Authorise hosts to only edit their own events - but need to redirect away from error
    @listing = current_user.listing
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Event was successfully updated!"
    else
      render :edit, alert: "Your event wasn't updated"
    end 
  end 

  def destroy
    # Authorise hosts to only destroy their own events
    @listing = current_user.listing
    @listing.destroy

    redirect_to root_path, notice: "Your event was deleted"
  end 

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end 

  def listing_params
    params.require(:listing).permit(:title, :description, :date, :max_guests, :price, :user_id, :picture)
  end

end
