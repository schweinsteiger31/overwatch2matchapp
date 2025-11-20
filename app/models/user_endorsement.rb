class UserEndorsement < ApplicationRecord
  belongs_to :endorser, class_name: "User"
  belongs_to :endorsee, class_name: "User"
  belongs_to :endorsement_tag

  # 同じ人が、同じ相手に、同じタグを複数回付けられないように。
  validates :endorser_id, uniqueness: { scope: [:endorsee_id, :endorsement_tag_id] }
end