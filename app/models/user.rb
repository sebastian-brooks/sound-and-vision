class User < ApplicationRecord
  rolify

  has_many :artists

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
