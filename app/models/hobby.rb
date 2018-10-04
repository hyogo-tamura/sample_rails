class Hobby < ApplicationRecord
  has_many :user_hobbies
  has_many :users, through: :user_hobbies

  validates:title,
    presence: true,
    length: { maximum:40 }, 
    uniqueness: true

end
