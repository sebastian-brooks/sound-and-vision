class Artist < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :songs, dependent: :destroy
end
