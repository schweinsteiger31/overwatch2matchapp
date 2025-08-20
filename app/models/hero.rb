class Hero < ApplicationRecord
  enum :role, { tank: 0, damage: 1, support: 2 }

  has_many :play_models
end
