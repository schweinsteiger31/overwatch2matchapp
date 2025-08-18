class PlayModel < ApplicationRecord
  belongs_to :user
  belongs_to :gender
  belongs_to :play_time
  belongs_to :play_style
  belongs_to :talk_style
end
