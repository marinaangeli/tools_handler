puts "Cleaning database"

User.destroy_all
Tool.destroy_all

puts "Database is clean!"

puts "Generating users"

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    state: Faker::Address.state,
    city: Faker::Address.city,
    area: Faker::Address.community,
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number
  )
end

@users = User.all

@users.each do |user|
  puts "#{user.email} - #{user.password} - #{user.name} - #{user.state} - #{user.city} - #{user.area} - #{user.address} - #{user.phone}"
end

@users_id = []

@users.each do |user|

  @users_id << user.id

end

10.times do
  Tool.create(
    name: Faker::House.furniture,
    price: rand(1..200),
    user_id: @users_id.sample
  )
end

@tools = Tool.all

@tools.each do |tool|
  puts "#{tool.name} - #{tool.price} - #{tool.user_id}"
end
