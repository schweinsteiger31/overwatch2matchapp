class CreatePlayModels < ActiveRecord::Migration[8.0]
  def change
    create_table :play_models do |t|
      t.references :play_time, null: false, foreign_key: true
      t.references :play_style, null: false, foreign_key: true
      t.references :talk_style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
