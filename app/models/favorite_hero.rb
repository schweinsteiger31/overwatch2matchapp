class FavoriteHero < ApplicationRecord
  belongs_to :play_model
  belongs_to :hero
  self.table_name = "favorite_heroes"
end
