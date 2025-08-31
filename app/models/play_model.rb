class PlayModel < ApplicationRecord
  belongs_to :user
  belongs_to :play_time
  belongs_to :play_style
  belongs_to :talk_style


  belongs_to :tank_rank, class_name: "Rank", optional: true
  belongs_to :damage_rank, class_name: "Rank", optional: true
  belongs_to :support_rank, class_name: "Rank", optional: true

  has_many :favorite_heroes
  has_many :heroes, through: :favorite_heroes

  validates :play_time_id, presence: true
  validates :play_style_id, presence: true
  validates :talk_style_id, presence: true
  validate :favorite_hero_limit



  private

  def favorite_hero_limit
    errors.add(:heroes, "は6体までしか登録できません") if heroes.size > 6
  end
end
