class DropFavoriteHeroes < ActiveRecord::Migration[8.0]
  def change
    drop_table :favorite_heroes
  end
end
