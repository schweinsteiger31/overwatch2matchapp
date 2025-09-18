class HeroProficiency < ApplicationRecord
  belongs_to :user
  belongs_to :hero

  
  enum :proficiency_level, {
    expert: 0,        # 大得意
    proficient: 1,    # 得意
    weak: 2,          # 不得意
    unable_to_play: 3 # 不可
  }
end
