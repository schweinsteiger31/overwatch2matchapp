class CreateFavoriteHeroes < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_heroes do |t|
      t.references :play_model, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: { to_table: :heroes }

      t.timestamps
    end
  end
end
