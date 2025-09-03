class CreatePartnerConditionHeros < ActiveRecord::Migration[8.0]
  def change
    create_table :partner_condition_heros do |t|
      t.references :partner_condition, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: { to_table: :heroes } 

      t.timestamps
    end
  end
end
