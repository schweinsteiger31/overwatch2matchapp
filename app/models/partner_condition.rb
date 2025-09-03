class PartnerCondition < ApplicationRecord
  belongs_to :user
  belongs_to :play_time, optional: true
  belongs_to :play_style, optional: true
  belongs_to :talk_style, optional: true

  has_many :role_criterions, dependent: :destroy
  has_many :partner_condition_heroes, dependent: :destroy
  has_many :heroes, through: :partner_condition_heroes

  accepts_nested_attributes_for :role_criterions, allow_destroy: true
  accepts_nested_attributes_for :partner_condition_heroes, allow_destroy: true

  attribute :age_preference, :integer
  attribute :target_role,    :integer

  enum :age_preference, { any: 0, adults_only: 1, close_in_age: 2 }, prefix: true
  enum :target_role, { any: 0, tank: 1, damage: 2, support: 3 }, prefix: true
end