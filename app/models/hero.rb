class Hero < ApplicationRecord
  self.table_name = "heroes"
  enum :role, { tank: 0, damage: 1, support: 2 }
end
