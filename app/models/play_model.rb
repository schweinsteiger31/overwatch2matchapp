class PlayModel < ApplicationRecord
  belongs_to :user
  belongs_to :play_time
  belongs_to :play_style
  belongs_to :talk_style


  belongs_to :tank_rank, class_name: "Rank"
  belongs_to :damage_rank, class_name: "Rank"
  belongs_to :support_rank, class_name: "Rank"

  validates :play_time_id, presence: true
  validates :play_style_id, presence: true
  validates :talk_style_id, presence: true
  validates :tank_rank_id, :damage_rank_id, :support_rank_id, presence: true

end
