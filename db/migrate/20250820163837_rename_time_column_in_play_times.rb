class RenameTimeColumnInPlayTimes < ActiveRecord::Migration[7.0]
  def change
    rename_column :play_times, :time, :time_slot
  end
end
