class PlayTime < ApplicationRecord
  enum time: { daytime: 0, night: 1, alldays: 2 }

  has_many :play_models
end
