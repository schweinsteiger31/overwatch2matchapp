class Rank < ApplicationRecord
  has_many :tank_play_models, class_name: "PlayModel", foreign_key: "tank_rank_id"
  has_many :damage_play_models, class_name: "PlayModel", foreign_key: "damage_rank_id"
  has_many :support_play_models, class_name: "PlayModel", foreign_key: "support_rank_id"
end
