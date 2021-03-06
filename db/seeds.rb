# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#brands
porsche = Brand.create(name: "Porsche", logo: "https://www.logodesignlove.com/images/car/porsche-logo-01.jpg")
mg = Brand.create(name: "MG", logo: "https://upload.wikimedia.org/wikipedia/en/6/66/New_mg_logo.png")
chevy = Brand.create(name: "Chevrolet", logo: "http://www.carlogos.org/logo/Chevrolet-logo-2013-640x281.jpg")

#car_types
sedan = CarType.create(name:"sedan")
roadster = CarType.create(name: "roadster")
coupe = CarType.create(name: "coupe")

#cars
impala = Car.create(name: "Impala", brand_id: chevy.id, year: 1969, photo_url: "https://upload.wikimedia.org/wikipedia/commons/1/11/1965_Chevrolet_Impala_Super_Sport_Coupe_%281%29.JPG")
impala.car_types << sedan
impala.save


porsche911 = Car.create(name: "911", brand_id: porsche.id, year: 1969, photo_url: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Porsche_911E_ca_1969.jpg")
porsche911.car_types << coupe
porsche911.car_types << roadster
porsche911.save

mgb = Car.create(name: "MGB", brand_id: mg.id, year: 1969, photo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/MG_MGB_open_roadster_1969.jpg/1024px-MG_MGB_open_roadster_1969.jpg")
mgb.car_types << roadster
mgb.car_types << coupe
mgb.save

#users
john = User.create(username: "John", email: "johnstr123@gmail.com", password: "password")

admin = User.create(username: "Admin", email: "admin@clunkr.com", password: "password", admin: true)


mike = User.create(username: "Mike", email: "strickergang@live.com", password: "password")

#resource_types
manual = ResourceType.create(name: "manual")
video = ResourceType.create(name: "video")
marketplace = ResourceType.create(name: "marketplace")

#resources
impala_manual = impala.resources.create(title: "1969 Chevy Impala Owners Manual", source_url: "https://www.manualslib.com/manual/928984/Chevrolet-Impala-1969.html?page=2#manual",resource_type_id: manual.id)

porsche911_manual = porsche911.resources.create(title: "1969 Porsche 911 Owner's Manual", source_url: "http://content.us.porsche-clubs.porsche.com/PorscheClubs/klassieke-porsche-911-en-912-club/files/Porsche911T1969_1970USownersmanual.pdf", resource_type_id: manual.id)

mgb_manual = mgb.resources.create(title: "1969 MGB Owner's Manual", source_url: "http://www.geomatique-liege.be/MGJP/DocumentsPDF/MGB_Workshop_Manual.pdf", resource_type_id: manual.id)

porsche911_video = porsche911.resources.create(title: "1969 Porsche 911S 'Rush' Fully Restored.", source_url: "https://www.youtube.com/watch?v=SHfWA-nI7IE", resource_type_id: video.id)

impala_video = impala.resources.create(title: "1969 Chevrolet Impala Custom Coupe Five-Speed", source_url: "https://www.youtube.com/watch?v=VVWXsssZILM", resource_type_id: video.id)

mgb_video = mgb.resources.create(title: "MG MGB Differential Maintenance Spacer replacement", source_url: "https://www.youtube.com/watch?v=07c53QjmScw&t=4s", resource_type_id: video.id)

general = Resource.create(title: "Hemmings.com", source_url: "https://www.hemmings.com/", resource_type_id: marketplace.id)

#user_cars

john_mgb_1 = john.user_cars.create(car_id: mgb.id, color: "#9D9F95")
john_mgb_2 = john.user_cars.create(car_id: mgb.id, color: "#1C8863")

mike_impala_1 = mike.user_cars.create(car_id: impala.id, color: "#5BE3FF")
mike_porsche_1 = mike.user_cars.create(car_id: porsche911.id, color: "#1C8863")
