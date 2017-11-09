# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#brands
porsche = Brand.create(name: "Porsche")
mg = Brand.create(name: "MG")
chevy = Brand.create("Chevrolet")

#car_types
sedan = CarType.create(name:"sedan")
roadster = CarType.create(name: "roadster")
coupe = CarType.create(name: "coupe")

#cars
impala = Car.create(name: "Impala", brand: chevy, year: 1969, photo_url: "https://upload.wikimedia.org/wikipedia/commons/1/11/1965_Chevrolet_Impala_Super_Sport_Coupe_%281%29.JPG
")
porsche911 = Car.create(name: "911", brand: porsche, year: 1969, photo_url: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Porsche_911E_ca_1969.jpg")

mgb = Car.create(name: "MGB", brand: mg, year: 1969, photo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/MG_MGB_open_roadster_1969.jpg/1024px-MG_MGB_open_roadster_1969.jpg"

#users
jim = User.create(name: "Jim", email: "jmstricker93@gmail.com", password: "password")
mike = User.create(name: "Mike", email: "strickergang@live.com", password: "password")

#resource_types
manual = ResourceType.create(name: "manual")
video = ResourceType.create(name: "video")

#resources
impala_manual = impala.resources.create(title: "1969 Chevy Impala Owners Manual", source_url: "https://www.manualslib.com/manual/928984/Chevrolet-Impala-1969.html?page=2#manual",resource_type_id: manual.id)

porsche911_manual = porsche911.resources.create(title: "1969 Porsche 911 Owner's Manual", source_url: "http://content.us.porsche-clubs.porsche.com/PorscheClubs/klassieke-porsche-911-en-912-club/files/Porsche911T1969_1970USownersmanual.pdf", resource_type_id: manual.id)

mgb_manual = mgb.resources.create(title: "1969 MGB Owner's Manual", source_url: "http://www.geomatique-liege.be/MGJP/DocumentsPDF/MGB_Workshop_Manual.pdf", resource_type_id: manual.id)

porsche911_video = porsche911.resources.create(title: "1969 Porsche 911S "Rush" Fully Restored.", source_url: "https://www.youtube.com/watch?v=SHfWA-nI7IE", resource_type_id: video.id)

impala_video = impala.resources.create(title: "1969 Chevrolet Impala Custom Coupe Five-Speed", source_url: "https://www.youtube.com/watch?v=VVWXsssZILM", resource_type_id: video.id)

mgb_video = mgb.resources.create(title: "MG MGB Differential Maintenance Spacer replacement", source_url: "https://www.youtube.com/watch?v=07c53QjmScw&t=4s", resource_type_id: video.id)

general =

#user_cars

jim_mgb_1 = jim.user_cars.create(car_id: mgb.id, color: "(BRG) British Racing Green")
jim_mgb_2 = jim.user_cars.create(car_id: mgb.id, color: "Red")

mike_impala_1 = mike.user_cars.create(car_id: impala.id, color: "Light Blue")
mike_porsche_1 = mike.user_cars.create(car_id: porsche911.id, color: "(BRG) British Racing Green")
