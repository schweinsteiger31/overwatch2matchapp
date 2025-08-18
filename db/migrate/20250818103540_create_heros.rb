class CreateHeros < ActiveRecord::Migration[8.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.timestamps
    end
  end
end
