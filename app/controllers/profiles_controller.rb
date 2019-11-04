class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # Authentication not required for browsing profiles
  before_action :authenticate_user!, except: [:show, :index]

  
  def index
    @profiles = Profile.all
  end

  def show
    if current_user.profile != @profile
      redirect_to root_path
    end
  end

  def new
    @profile = Profile.new 
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
		@profile.save
		redirect_to @profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Event was successfully updated!"
    else
      render :edit, alert: "Your event wasn't updated"
    end 
  end

  def destroy
  end


  private

  def set_profile
    @profile = Profile.find(params[:id])
  end 

  def profile_params
    params.require(:profile).permit(:about, :first_name, :last_name)
  end

end
