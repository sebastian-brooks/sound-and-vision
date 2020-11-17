# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create!(
    email: "seed@sound-vision.com",
    password: "password",
    first_name: "Seeded Admin",
    last_name: "User"
)
User.find(1).add_role(:admin)
User.find(1).add_role(:artist)

artists = [
    {
        name: "Dunn Dore",
        description: "I made sounds go bleep",
        email: "dunndore@music.com",
        website: "https://sound-vision.herokuapp.com/",
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
        description: "Sonic sleepless but sonic is farst",
        email: "calcium@music.com",
        website: "https://sound-vision.herokuapp.com/",
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
        website: "https://sound-vision.herokuapp.com/",
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
        description: "Angry rah rah music",
        email: "eyelands@music.com",
        website: "https://sound-vision.herokuapp.com/",
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
        description: "Spooky scary songs that spagett you",
        email: "ghosthurter@music.com",
        website: "https://sound-vision.herokuapp.com/",
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
        website: "https://sound-vision.herokuapp.com/",
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
        website: "https://sound-vision.herokuapp.com/",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Peep Peep Toot Toot",
        description: "I watch and see everything",
        email: "observer@music.com",
        website: "https://sound-vision.herokuapp.com/",
        user_id: User.first.id,
        image: {
            io: File.open("app/assets/images/artist.png"),
            filename: "artist.png",
            content_type: "image/png",
            identify: false
        }
    },
    {
        name: "Duck Guy",
        description: "I live in my house!",
        email: "rhubarb@music.com",
        website: "https://sound-vision.herokuapp.com/",
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
        website: "https://sound-vision.herokuapp.com/",
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
        name: "Protein Moon",
        description: "A hardcore techno song that sounds like you wish you were dead",
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
        name: "Pro Teen Sky",
        description: "Broken machinery and you're stuck on a bus",
        price: 3.50,
        exclusive_price: 999.00,
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
        name: "Running Fields",
        description: "Like water torture but fun!",
        price: 0.50,
        exclusive_price: 666.00,
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
        name: "My Eye",
        description: "A theme of disco and punk",
        price: 10.00,
        exclusive_price: 10000.00,
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
        name: "I Do This Every Night",
        description: "Babaloo please don't you laugh doc",
        price: 4.20,
        exclusive_price: 420.00,
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
        name: "Howling Meat",
        description: "A fun track feat. the reanimated corpse of Jeff Buckley",
        price: 7.00,
        exclusive_price: 67.00,
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
        name: "Driving Bonds",
        description: "The interstices of fun and things that taste grey",
        price: 9.00,
        exclusive_price: 27.50,
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
        name: "From My Street",
        description: "All the powder from a trumpet Gabriel",
        price: 10.00,
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
        description: "Flush hard, it's a long way to Athens",
        price: 8.00,
        exclusive_price: 80.00,
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
        description: "Dead in the water",
        price: 88.00,
        exclusive_price: 888.00,
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
    {song_id: 1, genre_id: rand(1..41)},
    {song_id: 1, genre_id: rand(1..41)},
    {song_id: 2, genre_id: rand(1..41)},
    {song_id: 2, genre_id: rand(1..41)},
    {song_id: 2, genre_id: rand(1..41)},
    {song_id: 2, genre_id: rand(1..41)},
    {song_id: 3, genre_id: rand(1..41)},
    {song_id: 3, genre_id: rand(1..41)},
    {song_id: 3, genre_id: rand(1..41)},
    {song_id: 3, genre_id: rand(1..41)},
    {song_id: 4, genre_id: rand(1..41)},
    {song_id: 4, genre_id: rand(1..41)},
    {song_id: 4, genre_id: rand(1..41)},
    {song_id: 4, genre_id: rand(1..41)},
    {song_id: 5, genre_id: rand(1..41)},
    {song_id: 5, genre_id: rand(1..41)},
    {song_id: 5, genre_id: rand(1..41)},
    {song_id: 5, genre_id: rand(1..41)},
    {song_id: 6, genre_id: rand(1..41)},
    {song_id: 6, genre_id: rand(1..41)},
    {song_id: 6, genre_id: rand(1..41)},
    {song_id: 6, genre_id: rand(1..41)},
    {song_id: 7, genre_id: rand(1..41)},
    {song_id: 7, genre_id: rand(1..41)},
    {song_id: 7, genre_id: rand(1..41)},
    {song_id: 7, genre_id: rand(1..41)},
    {song_id: 8, genre_id: rand(1..41)},
    {song_id: 8, genre_id: rand(1..41)},
    {song_id: 8, genre_id: rand(1..41)},
    {song_id: 8, genre_id: rand(1..41)},
    {song_id: 9, genre_id: rand(1..41)},
    {song_id: 9, genre_id: rand(1..41)},
    {song_id: 9, genre_id: rand(1..41)},
    {song_id: 9, genre_id: rand(1..41)},
    {song_id: 10, genre_id: rand(1..41)},
    {song_id: 10, genre_id: rand(1..41)}
    {song_id: 10, genre_id: rand(1..41)},
    {song_id: 10, genre_id: rand(1..41)}
]

SongsGenre.destroy_all
SongsGenre.create!(song_genres)
