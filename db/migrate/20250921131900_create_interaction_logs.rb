class CreateInteractionLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :interaction_logs do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :target_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
