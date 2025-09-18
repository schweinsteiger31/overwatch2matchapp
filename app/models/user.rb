class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :play_model, dependent: :destroy
  has_many :hero_proficiencies, dependent: :destroy 

  has_many :sent_likes, class_name: "Like", foreign_key: "sender_id", dependent: :destroy
  has_many :liked_users, through: :sent_likes, source: :receiver
  # 自分宛の「いいね」の関連付け
  has_many :received_likes, class_name: "Like", foreign_key: "receiver_id", dependent: :destroy
  # received_likesを通じて、自分を「いいね」したユーザーの一覧を取得
  has_many :liking_users, through: :received_likes, source: :sender

  def matched_with?(other_user)
    Match.where(user_one_id: self.id, user_two_id: other_user.id)
         .or(Match.where(user_one_id: other_user.id, user_two_id: self.id))
         .exists?
  end

  enum :gender, { male: 0, female: 1, other: 2 }

  accepts_nested_attributes_for :hero_proficiencies

  validates :name, presence: true, on: :update
  validates :email, presence: true, uniqueness: true
end
