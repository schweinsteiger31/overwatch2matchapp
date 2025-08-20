class PlayStyle < ApplicationRecord
  enum style: { enjoy: 0, normal: 1, strict: 2 }

  has_many :play_models
end
