# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Penting.destroy_all

first_user = User.create!(:email=>"test1@gmail.com",password: "12345678",:user_name=>"test123",country: "IN",city:"varanasi",full_name: "Test",contact_number: "+918791905452",about: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
if first_user.present?
	["https://res.cloudinary.com/dwx91ccew/image/upload/v1560814413/Wallpaper-Room-Set.jpg","https://res.cloudinary.com/dwx91ccew/image/upload/v1560814393/accidental-art-14-5745a1d48b637__605.jpg","https://res.cloudinary.com/dwx91ccew/image/upload/v1560814401/VVRRR_-_Manolo_April_2018.jpg","https://res.cloudinary.com/dwx91ccew/image/upload/v1560814405/download.jpg"].each do |image|
		first_user.pentings.create(image: image, is_public: true)
	end
end	

second_user = User.create!(:email=>"test11@gmail.com",password: "12345678",:user_name=>"test1234",country: "IN",city:"varanasi",full_name: "Test",contact_number: "+918791905452",about: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
if second_user.present?
	["https://res.cloudinary.com/dwx91ccew/image/upload/v1560814437/images_1.jpg","https://res.cloudinary.com/dwx91ccew/image/upload/v1560814430/images.jpg","https://res.cloudinary.com/dwx91ccew/image/upload/v1560814425/download_1.jpg","https://res.cloudinary.com/dwx91ccew/image/upload/v1560814421/228635.jpg"].each do |image|
		second_user.pentings.create(image: image, is_public: true)
	end
end