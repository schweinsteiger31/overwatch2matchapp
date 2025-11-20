class Like < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  #複数回いいねできないように
  validates :sender_id, uniqueness: { scope: :receiver_id }
end
