class Artist < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :songs, dependent: :destroy

  validates :name, :presence => true, uniqueness: true, length: { maximum: 50, too_long: "must be a maximum of %{count} characters" }
  validates :email, :presence => true, length: { maximum: 100, too_long: "must be a maximum of %{count} characters" }
  validates :description, :presence => true, length: { maximum: 250, too_long: "must be a maximum of %{count} characters" }
end
