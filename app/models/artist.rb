class Artist < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :songs, dependent: :destroy
  
  validates :image, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  validates :name, presence: true, uniqueness: true, length: { maximum: 50, too_long: "must be a maximum of %{count} characters" }
  validates :email, presence: true, length: { maximum: 100, too_long: "must be a maximum of %{count} characters" }
  validates :description, presence: true, length: { maximum: 250, too_long: "must be a maximum of %{count} characters" }
  validates :website, length: { maximum: 100, too_long: "must be a maximum of %{count} characters" }
  
  scope :with_attached_image, -> { includes(image_attachment: :blob) }
end
