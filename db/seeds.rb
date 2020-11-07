# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = [
    {name: "ambient"},
    {name: "electronic"},
    {name: "rock"},
    {name: "country"},
    {name: "hip hop"},
    {name: "metal"},
    {name: "heavy"},
    {name: "atmospheric"},
    {name: "soundtrack"},
    {name: "loop"},
    {name: "sample"},
    {name: "classical"},
    {name: "instrumental"},
    {name: "indie"},
    {name: "punk"},
    {name: "post-rock"},
    {name: "post-punk"},
    {name: "post-metal"},
    {name: "spoken word"},
    {name: "hard rock"},
    {name: "rnb"},
    {name: "soul"},
    {name: "funk"},
    {name: "blues"},
    {name: "jazz"},
    {name: "folk"},
    {name: "avant garde"},
    {name: "experimental"},
    {name: "industrial"},
    {name: "noise"},
    {name: "progressive"},
    {name: "alternative"},
    {name: "techno"},
    {name: "dance"},
    {name: "reggae"},
    {name: "drum and bass"},
    {name: "house"},
    {name: "trip-hop"},
    {name: "solo instrument"},
    {name: "dark"},
    {name: "pop"}
]

Genre.destroy_all

Genre.create!(genres)