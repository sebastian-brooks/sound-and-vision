# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user = User.new
user.email = "seed@sound-vision.com"
user.first_name = "Seeded Admin"
user.last_name = "User"
user.password = "password"
user.password_confirmation = "password"
user.save!
User.find(1).add_role(:admin)
User.find(1).add_role(:artist)

artists = [
    {
        name: "Aphelion",
        description: "I made sounds go bleep",
        email: "aphelion@music.com",
        website: "https://www.aphelion.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Calcium",
        description: "Sonic sleeplessness",
        email: "calcium@music.com",
        website: "https://www..com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Cheese",
        description: "Tastes nice, is nice",
        email: "cheese@music.com",
        website: "https://www.cheese.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Eye Lands",
        description: "Angry rah rah",
        email: "eyelands@music.com",
        website: "https://www.eyelands.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Ghost Hurter",
        description: "London based musician",
        email: "ghosthurter@music.com",
        website: "https://www.ghosthurter.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Henry Plum",
        description: "Trio from the east side",
        email: "henryplum@music.com",
        website: "https://www.henryplum.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Mucor",
        description: "Soundscapes that go bloop diddy wah",
        email: "mucor@music.com",
        website: "https://www.mucor.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Observer",
        description: "I watch and see everything",
        email: "observer@music.com",
        website: "https://www.observer.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Rhubarb",
        description: "I live in my house!",
        email: "rhubarb@music.com",
        website: "https://www.rhubarb.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Teeth",
        description: "Fun to eat",
        email: "teeth@music.com",
        website: "https://www.teeth.com",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    }
]

Artist.destroy_all
Artist.create!(artists)

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

songs = [
    {
        name: "'Neath a Protein Moon",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 1,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "In a Protein Sky",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 2,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "Running Protein Fields",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 3,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "With My Protein Eye",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 4,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "There's a Protein Song",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 5,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "Howling Through Meat",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 6,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "Driving Protein Bods",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 7,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "From My Protein Street",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 8,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "Pain Is Not Alone",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 9,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    },
    {
        name: "Here's to a Lousy Life",
        description: "A fun track feat. Justin Case on theremin",
        price: 2.00,
        exclusive_price: 10.00,
        purchases: 0,
        available: true,
        artist_id: 10,
        song_file: {
            io: File.open("app/assets/audio/song1.mp3"),
            filename: "song1.mp3",
            content_type: "audio/mpeg",
            identify: false
        }
    }
    
]

Song.destroy_all
Song.create!(songs)

song_genres = [
    {song_id: 1, genre_id: rand(1..41)},
    {song_id: 1, genre_id: rand(1..41)},
    {song_id: 2, genre_id: rand(1..41)},
    {song_id: 2, genre_id: rand(1..41)},
    {song_id: 3, genre_id: rand(1..41)},
    {song_id: 3, genre_id: rand(1..41)},
    {song_id: 4, genre_id: rand(1..41)},
    {song_id: 4, genre_id: rand(1..41)},
    {song_id: 5, genre_id: rand(1..41)},
    {song_id: 5, genre_id: rand(1..41)},
    {song_id: 6, genre_id: rand(1..41)},
    {song_id: 6, genre_id: rand(1..41)},
    {song_id: 7, genre_id: rand(1..41)},
    {song_id: 7, genre_id: rand(1..41)},
    {song_id: 8, genre_id: rand(1..41)},
    {song_id: 8, genre_id: rand(1..41)},
    {song_id: 9, genre_id: rand(1..41)},
    {song_id: 9, genre_id: rand(1..41)},
    {song_id: 10, genre_id: rand(1..41)},
    {song_id: 10, genre_id: rand(1..41)}
]

SongsGenre.destroy_all
SongsGenre.create!(song_genres)
