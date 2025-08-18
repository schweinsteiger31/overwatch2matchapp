class CreatePlayTimes < ActiveRecord::Migration[8.0]
  def change
    create_table :play_times do |t|
      t.string :name

      t.timestamps
    end
  end
end
