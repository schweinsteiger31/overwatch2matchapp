class AddMissingColumnsToPartnerConditions < ActiveRecord::Migration[8.0]
  def change
    add_reference :partner_conditions, :rank, null: false, foreign_key: true
    add_column :partner_conditions, :target_role, :integer
  end
end
