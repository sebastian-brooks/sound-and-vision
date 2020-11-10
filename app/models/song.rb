class Song < ApplicationRecord
  belongs_to :artist
  has_one_attached :song_file
  
  has_many :songs_genre, dependent: :destroy
  has_many :genres, through: :songs_genre

  def self.search(search)
    where("lower(artists.name) LIKE :search OR lower(songs.name) LIKE :search", search: "%#{search.downcase}%")
  end
end
