# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



fred = User.create(username: "Fred")
User.create(uUsesername: "George")
User.create(username: "Bill") 

Artwork.create(title:"Mona Lisa", artist_id: 9, image_url: "monalisa.com")
Artwork.create(title:"Banksy", artist_id: 10, image_url: "banksy.com")
Artwork.create(title:"Sistine Chapel", artist_id: 8, image_url: "sistinechapel.com")

ArtworkShare.create(artwork_id: 1, viewer_id: 10)
ArtworkShare.create(artwork_id: 2, viewer_id: 9)
ArtworkShare.create(artwork_id: 3, viewer_id: 8)
