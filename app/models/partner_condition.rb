class PartnerCondition < ApplicationRecord
  belongs_to :user
  belongs_to :play_time, optional: true
  belongs_to :play_style, optional: true
  belongs_to :talk_style, optional: true

  has_many :role_criterions, dependent: :destroy
  has_many :partner_condition_heroes, dependent: :destroy
  has_many :heroes, through: :partner_condition_heroes

  enum age_preference: { any: 0, adults_only: 1, close_in_age: 2 }
end