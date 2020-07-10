class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments

  validates :first_name,
            presence: true,
            allow_blank: false

  validates :last_name,
            presence: true,
            allow_blank: false

  def full_name
    "#{first_name} #{last_name}"
  end
end
