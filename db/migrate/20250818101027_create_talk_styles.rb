class CreateTalkStyles < ActiveRecord::Migration[8.0]
  def change
    create_table :talk_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end
