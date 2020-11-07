class Song < ApplicationRecord
  belongs_to :artist
  has_one_attached :song_file
end
