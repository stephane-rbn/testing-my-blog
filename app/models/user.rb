class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles

  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 2 }
end
