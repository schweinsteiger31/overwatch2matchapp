class CreateUserEndorsements < ActiveRecord::Migration[8.0]
  def change
    create_table :user_endorsements do |t|
      t.references :endorser, null: false, foreign_key: { to_table: :users }
      t.references :endorsee, null: false, foreign_key: { to_table: :users }
      t.references :endorsement_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
