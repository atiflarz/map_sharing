include Faker
lat_long = [['22.565571', '88.370209'], ['28.704060', '77.102493'], ['13.082680', '80.270721'], ['19.075983', '72.877655'], ['23.647394', '86.952393']]
if User.count == 0
  5.times do
    User.create(email: Faker::Internet.email, user_name: Faker::Name.unique.name, password: 'user@123', password_confirmation: 'user@123')
  end

  User.all.each_with_index do |user, i|
    lat_long.each do |latlng|
      user.places.create(latitude: latlng[0], longitude: latlng[1], is_public: true)
    end
  end
end
