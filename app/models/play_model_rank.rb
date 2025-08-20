class PlayModelRank < ApplicationRecord
  belongs_to :play_model
  belongs_to :rank

  enum role: { tank: 0, damage: 1, support: 2 }

  validates :role, uniqueness: { scope: :play_model_id }
end
