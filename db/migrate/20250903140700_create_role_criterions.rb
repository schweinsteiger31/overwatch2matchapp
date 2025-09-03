class CreateRoleCriterions < ActiveRecord::Migration[8.0]
  def change
    create_table :role_criterions do |t|
      t.references :partner_condition, null: false, foreign_key: true
      t.integer :role
      t.references :rank, null: false, foreign_key: true
      t.integer :condition_type

      t.timestamps
    end
  end
end
