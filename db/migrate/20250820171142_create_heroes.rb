class CreateHeroes < ActiveRecord::Migration[8.0]
  def change
    create_table :heroes do |t|
      t.string :name
      t.integer :role     
      t.string :icon_url 
      
      t.timestamps
    end
  end
end