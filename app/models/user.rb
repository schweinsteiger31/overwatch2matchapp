class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :play_model, dependent: :destroy

  has_many :user_heroes
  has_many :heroes, through: :user_heroes
  has_one :partner_condition, dependent: :destroy
  has_many :hero_proficiencies, dependent: :destroy 

  enum :gender, { male: 0, female: 1, other: 2 }

  validates :name, presence: true, on: :update
  validates :email, presence: true, uniqueness: true
end
