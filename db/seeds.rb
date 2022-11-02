puts "Cleaning database"
Rental.destroy_all
User.destroy_all
Tool.destroy_all

puts "Database is clean!"

puts "Generating users"

@adresses = ['Rua Hilário de Gouvêia, Copacabana, Rio de Janeiro, RJ', 'R. Visc. de Pirajá, 580 - Ipanema, Rio de Janeiro, RJ', 'R. Real Grandeza, 219 - Botafogo, Rio de Janeiro, RJ', 'R. Barão de Lucena, 99, Botafogo, Rio de Janeiro, RJ', 'R. Evaristo da Veiga, 264, Centro, Rio de Janeiro, RJ', 'R. Miguel Lemos, 174, Copacabana, Rio de Janeiro, RJ', 'R. Oliveira Fausto, 17, Botafogo, Rio de Janeiro, RJ', 'R. Jardim Botânico, 702-758, Jardim Botânico, Rio de Janeiro, RJ', 'R. José Linhares, Leblon, Rio de Janeiro, RJ', 'Av. Atlântica, 4240, Copacabana, Rio de Janeiro, RJ']
10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    address: @adresses.pop,
    phone: Faker::PhoneNumber.phone_number
  )
end

User.create(
  email: "teste@teste",
  password: "aaaaaa",
  name: "Marina",
  address: "R. Visc. de Pirajá, 142, rio de janeiro",
  phone: Faker::PhoneNumber.phone_number
)

@users = User.all

@users.each do |user|
  puts "#{user.email} - #{user.password} - #{user.name} - #{user.address} - #{user.phone}"
end

@users_id = []

@users.each do |user|
  @users_id << user.id
end


@tools = ['hammer', 'shovel', 'driller', 'handsaw', 'filer', 'wrench', 'stepladder', 'toolbox', 'plier', 'screwdriver']
@tool_adresses = ['Rua Hilário de Gouvêia, Copacabana, Rio de Janeiro, RJ', 'R. Visc. de Pirajá, 580 - Ipanema, Rio de Janeiro, RJ', 'R. Real Grandeza, 219 - Botafogo, Rio de Janeiro, RJ', 'R. Barão de Lucena, 99, Botafogo, Rio de Janeiro, RJ', 'R. Evaristo da Veiga, 264, Centro, Rio de Janeiro, RJ', 'R. Miguel Lemos, 174, Copacabana, Rio de Janeiro, RJ', 'R. Oliveira Fausto, 17, Botafogo, Rio de Janeiro, RJ', 'R. Jardim Botânico, 702-758, Jardim Botânico, Rio de Janeiro, RJ', 'R. José Linhares, Leblon, Rio de Janeiro, RJ', 'Av. Atlântica, 4240, Copacabana, Rio de Janeiro, RJ']
10.times do
  Tool.create(
    name: @tools.pop,
    price: rand(1..200),
    user_id: @users_id.sample,
    rating: rand(1..5),
    address: @tool_adresses.pop
  )
end

@tools = Tool.all

@tools.each do |tool|
  puts "#{tool.name} - #{tool.price} - #{tool.user_id} - #{tool.address} - #{tool.latitude} - #{tool.longitude}"
end
