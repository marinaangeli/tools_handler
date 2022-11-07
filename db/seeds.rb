puts "Cleaning database"
Rental.destroy_all
User.destroy_all
Tool.destroy_all

puts "Database is clean!"

puts "Generating users"

User.create(
  email: "lucio@lucio",
  password: "aaaaaa",
  name: "Lucio Telles",
  address: 'Rua Hilário de Gouvêia, Copacabana, Rio de Janeiro, RJ',
  phone: Faker::PhoneNumber.phone_number
  )

User.create(
  email: "teste@teste",
  password: "aaaaaa",
  name: "Marina Angeli",
  address: "R. Visc. de Pirajá, 142, rio de janeiro",
  phone: Faker::PhoneNumber.phone_number
)

User.create(
  email: "raul@raul",
  password: "aaaaaa",
  name: "Raul Chagas",
  address: 'R. José Linhares, Leblon, Rio de Janeiro, RJ',
  phone: Faker::PhoneNumber.phone_number
)

User.create(
email: "eysler@eysler",
password: "aaaaaa",
name: "Eysler Mara",
address: "R. Oliveira Fausto, 17, Botafogo, Rio de Janeiro, RJ",
phone: Faker::PhoneNumber.phone_number
)

@users = User.all

@users.each do |user|
  puts "#{user.email} - #{user.password} - #{user.name} - #{user.address} - #{user.phone}"
end



@user = @users.sample
@alicate_universal_8 = Tool.create(
  name: "Universal Plier 8",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@alicate_universal_8.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Alicate universal 8/alicate1.jpg')), filename: "alicate1.jpg")
@alicate_universal_8.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Alicate universal 8/alicate2.jpg')), filename: "alicate2.jpg")
@alicate_universal_8.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Alicate universal 8/alicate3.jpg')), filename: "alicate3.jpg")
@alicate_universal_8.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Alicate universal 8/alicate4.jpg')), filename: "alicate4.jpg")



@user = @users.sample
@caixa_sanfonada = Tool.create(
  name: "Tool Box",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@caixa_sanfonada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Caixa Sanfonada/00025.jpg')), filename: "caixa_sanfonada1.jpg")
@caixa_sanfonada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Caixa Sanfonada/00026.jpg')), filename: "caixa_sanfonada2.jpg")
@caixa_sanfonada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Caixa Sanfonada/00027.jpg')), filename: "caixa_sanfonada3.jpg")
@caixa_sanfonada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Caixa Sanfonada/00028.jpg')), filename: "caixa_sanfonada4.jpg")




@user = @users.sample
@chave_de_fenda_cruzada = Tool.create(
  name: "Phillips screwdriver",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@chave_de_fenda_cruzada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/chave de fenda cruzada/00017.jpg')), filename: "chave_de_fenda_cruzada1.jpg")
@chave_de_fenda_cruzada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/chave de fenda cruzada/00018.jpg')), filename: "chave_de_fenda_cruzada2.jpg")
@chave_de_fenda_cruzada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/chave de fenda cruzada/00019.jpg')), filename: "chave_de_fenda_cruzada3.jpg")
@chave_de_fenda_cruzada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/chave de fenda cruzada/00020.jpg')), filename: "chave_de_fenda_cruzada4.jpg")




@user = @users.sample
@compressor_de_ar = Tool.create(
  name: "air compressor",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@compressor_de_ar.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/compressor de ar/00029.jpg')), filename: "compressor_de_ar1.jpg")
@compressor_de_ar.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/compressor de ar/00030.jpg')), filename: "compressor_de_ar2.jpg")
@compressor_de_ar.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/compressor de ar/00031.jpg')), filename: "compressor_de_ar3.jpg")
@compressor_de_ar.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/compressor de ar/00032.jpg')), filename: "compressor_de_ar4.jpg")


@user = @users.sample
@esmerilhadeira = Tool.create(
  name: "Grinder",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@esmerilhadeira.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Esmerilhadeira/00037.jpg')), filename: "esmerilhadeira1.jpg")
@esmerilhadeira.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Esmerilhadeira/00038.jpg')), filename: "esmerilhadeira2.jpg")
@esmerilhadeira.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Esmerilhadeira/00039.jpg')), filename: "esmerilhadeira3.jpg")
@esmerilhadeira.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/Esmerilhadeira/00040.jpg')), filename: "esmerilhadeira4.jpg")




@user = @users.sample
@grampo_carpinteiro = Tool.create(
  name: "Clamp",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@grampo_carpinteiro.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/grampo carpinteiro/0005.jpg')), filename: "grampo_carpinteiro1.jpg")
@grampo_carpinteiro.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/grampo carpinteiro/0006.jpg')), filename: "grampo_carpinteiro2.jpg")
@grampo_carpinteiro.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/grampo carpinteiro/0007.jpg')), filename: "grampo_carpinteiro3.jpg")
@grampo_carpinteiro.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/grampo carpinteiro/0008.jpg')), filename: "grampo_carpinteiro4.jpg")




@user = @users.sample
@inversora_de_solda = Tool.create(
  name: "inverter welder",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@inversora_de_solda.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/inversora de solda/00021.jpg')), filename: "inversora_de_solda1.jpg")
@inversora_de_solda.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/inversora de solda/00022.jpg')), filename: "inversora_de_solda2.jpg")
@inversora_de_solda.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/inversora de solda/00023.jpg')), filename: "inversora_de_solda3.jpg")
@inversora_de_solda.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/inversora de solda/00024.jpg')), filename: "inversora_de_solda4.jpg")


@user = @users.sample
@marreta_oitavada = Tool.create(
  name: "soft faced hammer",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@marreta_oitavada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/marreta oitavada/0001.jpg')), filename: "marreta_oitavada1.jpg")
@marreta_oitavada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/marreta oitavada/0002.jpg')), filename: "marreta_oitavada2.jpg")
@marreta_oitavada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/marreta oitavada/0003.jpg')), filename: "marreta_oitavada3.jpg")
@marreta_oitavada.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/marreta oitavada/0004.jpg')), filename: "marreta_oitavada4.jpg")




@user = @users.sample
@serrote = Tool.create(
  name: "hacksaw",
  price: rand(1..200),
  user: @user,
  rating: rand(1..5),
  address: @user.address
)

@serrote.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/serrote/0009.jpg')), filename: "serrote1.jpg")
@serrote.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/serrote/00010.jpg')), filename: "serrote2.jpg")
@serrote.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/serrote/00011.jpg')), filename: "serrote3.jpg")
@serrote.photos.attach(io: File.open(Rails.root.join('app/assets/images/Fotos das ferramentas/serrote/00012.jpg')), filename: "serrote4.jpg")



@tools = Tool.all

@tools.each do |tool|
  puts "#{tool.name} - #{tool.price} - #{tool.user_id} - #{tool.address} - #{tool.latitude} - #{tool.longitude}"
end
