class ChangeRoleToEnumInHeros < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :role, :integer, null: false, default: 0
  end
end
