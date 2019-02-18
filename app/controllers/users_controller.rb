class UsersController < ApplicationController

  def show
    user = User.find_by(user_name: params[:id])
    @places = user.places.where(is_public: true).select(:latitude, :longitude)
  end
end
