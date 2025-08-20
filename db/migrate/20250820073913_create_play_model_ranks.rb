class CreatePlayModelRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :play_model_ranks do |t|
      t.references :play_model, null: false, foreign_key: true
      t.references :rank, null: false, foreign_key: true
      t.integer :role, null: false

      t.timestamps
    end
  end
end
