class CreateEndorsementTags < ActiveRecord::Migration[8.0]
  def change
    create_table :endorsement_tags do |t|
      t.string :name
      t.boolean :positive

      t.timestamps
    end
  end
end
