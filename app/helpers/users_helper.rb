module UsersHelper

  def location_message(places)
    if places.empty?
      msg = 'No Location Shared'
    else
      msg = 'Shared Locations'
    end
    msg.html_safe
  end
end
