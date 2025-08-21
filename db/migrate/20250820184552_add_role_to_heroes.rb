class AddRoleToHeroes < ActiveRecord::Migration[7.0]
  def change
    add_column :heroes, :role, :integer, null: false, default: 0
  end
end