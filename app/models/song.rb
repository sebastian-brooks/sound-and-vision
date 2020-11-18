class Song < ApplicationRecord
  belongs_to :artist
  has_one_attached :song_file
  
  has_many :songs_genre, dependent: :destroy
  has_many :genres, through: :songs_genre

  has_many :user_song, dependent: :destroy
  has_many :users, through: :user_song

  attribute :purchases, default: 0
  attribute :available, default: true

  validates :song_file, presence: true, blob: { content_type: ['audio/mpeg', 'audio/wav'], size_range: 0..100.megabytes }
  validates :name, presence: true, length: { maximum: 50, too_long: "must be a maximum of %{count} characters" }
  validates :description, length: { maximum: 250, too_long: "must be a maximum of %{count} characters" }
  validates :price, numericality: { greater_than_or_equal_to: 0.5, message: "Minimum price is $0.50" }
  validates :exclusive_price, numericality: { greater_than_or_equal_to: 0.5, message: "Minimum price is $0.50" }
  validates :artist, presence: true

  def self.search(search)
    where("lower(artists.name) LIKE :search OR lower(songs.name) LIKE :search", search: "%#{search.downcase}%")
  end
end
