class TalkStyle < ApplicationRecord
  enum :vc, { no: 0, yes: 1 }

  has_many :play_models
end
