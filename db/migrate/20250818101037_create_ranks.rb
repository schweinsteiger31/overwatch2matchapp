class CreateRanks < ActiveRecord::Migration[8.0]
  def change
    create_table :ranks do |t|
      t.string :name

      t.timestamps
    end
  end
end
