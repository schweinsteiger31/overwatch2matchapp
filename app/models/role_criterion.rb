class RoleCriterion < ApplicationRecord
  belongs_to :partner_condition
  belongs_to :rank, optional: true

  enum :role, Hero.roles
  enum :condition_type, { equal: 0, greater_than_or_equal_to: 1, any: 2}
end
