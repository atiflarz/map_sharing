module PlacesHelper
  def users_list
    User.all.collect{|p| [p.user_name, p.id]}
  end
end
