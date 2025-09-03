class CreatePartnerConditions < ActiveRecord::Migration[8.0]
  def change
    create_table :partner_conditions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age_preference
      t.references :play_time, null: false, foreign_key: true
      t.references :play_style, null: false, foreign_key: true
      t.references :talk_style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
