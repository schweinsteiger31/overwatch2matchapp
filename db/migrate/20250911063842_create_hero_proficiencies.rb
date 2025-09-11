class CreateHeroProficiencies < ActiveRecord::Migration[8.0]
  def change
    create_table :hero_proficiencies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: { to_table: :heroes }
      t.integer :proficiency_level

      t.timestamps
    end
  end
end
