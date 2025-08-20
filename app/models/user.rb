class User < ApplicationRecord
  has_secure_password

  has_one :play_model

  has_many :user_heroes
  has_many :heroes, through: :user_heroes

  enum gender: { male: 0, female: 1, other: 2 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
