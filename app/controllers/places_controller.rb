class PlacesController < ApplicationController

  def index
    @place = Place.new
    @place.place_recipients.build
    @users = User.where.not(id: current_user.id)
    place_ids = current_user.place_recipients.pluck(:place_id)
    @places = Place.where("user_id =? or id =?", current_user.id, place_ids).select(:latitude, :longitude)
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to places_url, notice: 'Place was successfully shared.'
    else
      redirect_to places_url, alert: @place.errors
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:latitude, :longitude, :is_public, place_recipients_attributes: [:id, :recipient_id, :_destroy])
    end
end
