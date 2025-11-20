class CreateUserRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :user_ratings do |t|
      t.references :rater, null: false, foreign_key: { to_table: :users }
      t.references :rated, null: false, foreign_key: { to_table: :users }

      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
