class CreatePlayTimes < ActiveRecord::Migration[8.0]
  def change
    create_table :play_times do |t|
      t.integer :time

      t.timestamps
    end
  end
end
