class UserRating < ApplicationRecord
  belongs_to :rater, class_name: "User"
  belongs_to :rated, class_name: "User"

  validates :rater_id, uniqueness: { scope: :rated_id }

  validates :score, presence: true, inclusion: { in: 1..5 }
end