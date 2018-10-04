class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_hobbies
  has_many :hobbies, through: :user_hobbies
  
  validates :username,
    presence: true,
    length: { maximum: 20 }
end
