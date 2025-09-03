class PartnerConditionHero < ApplicationRecord
  belongs_to :partner_condition
  belongs_to :hero
end