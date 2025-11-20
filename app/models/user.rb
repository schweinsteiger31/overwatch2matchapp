class User < ApplicationRecord
  # ログイン
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アバター
  has_one_attached :avatar


  has_one :play_model, dependent: :destroy
  
  has_many :hero_proficiencies, dependent: :destroy 
  accepts_nested_attributes_for :hero_proficiencies

  # いいね
  has_many :sent_likes, class_name: "Like", foreign_key: "sender_id", dependent: :destroy
  has_many :liked_users, through: :sent_likes, source: :receiver
  
  has_many :received_likes, class_name: "Like", foreign_key: "receiver_id", dependent: :destroy
  has_many :liking_users, through: :received_likes, source: :sender

  # 自分が送ったタグ評価
  has_many :given_endorsements, class_name: "UserEndorsement", foreign_key: "endorser_id", dependent: :destroy
  # 自分がタグ評価したユーザー一覧
  has_many :endorsed_users, through: :given_endorsements, source: :endorsee

  # 自分が受けたタグ評価
  has_many :received_endorsements, class_name: "UserEndorsement", foreign_key: "endorsee_id", dependent: :destroy
  # 自分をタグ評価したユーザー一覧
  has_many :endorsers, through: :received_endorsements, source: :endorser

  has_many :interaction_logs, foreign_key: "user_id", dependent: :destroy
  has_many :interacted_with_users, through: :interaction_logs, source: :target_user

  has_many :targeted_interaction_logs, class_name: "InteractionLog", foreign_key: "target_user_id", dependent: :destroy
  has_many :users_interacted_with, through: :targeted_interaction_logs, source: :user

  
  def matched_with?(other_user)
    Match.where(user_one_id: self.id, user_two_id: other_user.id)
         .or(Match.where(user_one_id: other_user.id, user_two_id: self.id))
         .exists?
  end

  # 性別（変更予定なし不変）
  enum :gender, { male: 0, female: 1, other: 2 }

  validates :name, presence: true, on: :update
  validates :email, presence: true, uniqueness: true
  validates :discord_id, presence: true, on: :update
end

