class Genre < ApplicationRecord
    has_many :songs_genre, dependent: :destroy
    has_many :songs, through: :songs_genre

    validates :name, presence: true, uniqueness: true, length: { maximum: 25, too_long: "must be a maximum of %{count} characters" }
end