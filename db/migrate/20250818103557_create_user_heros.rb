class CreateUserHeros < ActiveRecord::Migration[8.0]
  def change
    create_table :user_heros do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: true

      t.timestamps
    end
  end
end
