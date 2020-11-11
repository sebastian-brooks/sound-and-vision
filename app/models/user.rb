class User < ApplicationRecord
  rolify

  has_many :artists
  
  has_many :user_song, dependent: :destroy
  has_many :songs, through: :user_song

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
  
  def assign_default_role
    self.add_role(:buyer)
  end
end
