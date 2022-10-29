puts "Cleaning database"

User.destroy_all
Tool.destroy_all

puts "Database is clean!"

puts "Generating users"

@adresses = ['Rua Hilário de Gouvêia - Copacabana, Rio de Janeiro - RJ, 22040-020', 'R. Visc. de Pirajá, 580 - Ipanema, Rio de Janeiro - RJ, 22410-002', 'R. Real Grandeza, 219 - Botafogo, Rio de Janeiro - RJ, 22281-035', 'R. Barão de Lucena, 99 - Botafogo, Rio de Janeiro - RJ, 22260-020', 'R. Evaristo da Veiga, 264 - Centro, Rio de Janeiro - RJ, 20031-040', 'R. Miguel Lemos, 98-174 - Copacabana, Rio de Janeiro - RJ, 22071-000', 'R. Oliveira Fausto, 17 - Botafogo, Rio de Janeiro - RJ, 22280-090', 'R. Jardim Botânico, 702-758 - Jardim Botânico, Rio de Janeiro - RJ, 22470-051', 'R. José Linhares - Leblon, Rio de Janeiro - RJ, 22430-220', 'Av. Atlântica, 4240 - Copacabana, Rio de Janeiro - RJ, 22080-040']
10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    address: @adresses.pop,
    phone: Faker::PhoneNumber.phone_number
  )
end

@users = User.all

@users.each do |user|
  puts "#{user.email} - #{user.password} - #{user.name} - #{user.address} - #{user.phone}"
end

@users_id = []

@users.each do |user|

  @users_id << user.id

end

@tools = ['hammer', 'shovel', 'driller', 'handsaw', 'filer', 'wrench', 'stepladder', 'toolbox','pickaxer', 'vice']
10.times do
  Tool.create(
    name: Faker::House.furniture,
    price: rand(1..200),
    user_id: @users_id.sample,
    rating: rand(1..5)
  )
end

@tools = Tool.all

@tools.each do |tool|
  puts "#{tool.name} - #{tool.price} - #{tool.user_id}"
end
