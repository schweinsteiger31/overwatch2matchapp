class CreatePlayStyles < ActiveRecord::Migration[8.0]
  def change
    create_table :play_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
