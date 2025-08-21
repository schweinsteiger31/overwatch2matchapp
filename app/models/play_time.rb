class PlayTime < ApplicationRecord
  has_many :play_models

  enum :time_slot, { daytime: 0, night: 1, alldays: 2 }
end
