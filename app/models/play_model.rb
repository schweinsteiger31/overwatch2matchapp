class PlayModel < ApplicationRecord
  belongs_to :user
  belongs_to :play_time
  belongs_to :play_style
  belongs_to :talk_style
  has_many :play_model_ranks, dependent: :destroy
  has_many :ranks, through: :play_model_ranks

  # 例：validation
  validates :play_time_id, :play_style_id, :talk_style_id, :rank_id, presence: true
end
