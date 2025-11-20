class EndorsementTag < ApplicationRecord
  has_many :user_endorsements, dependent: :destroy

  
  scope :positive, -> { where(positive: true) }
  
  scope :negative, -> { where(positive: false) }
end