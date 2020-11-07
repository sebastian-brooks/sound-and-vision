class Genre < ApplicationRecord
    has_many :songs_genre
    has_many :songs, through: :songs_genre
end