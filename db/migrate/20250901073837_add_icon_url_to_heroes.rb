class AddIconUrlToHeroes < ActiveRecord::Migration[8.0]
  def change
    add_column :heroes, :icon_url, :string
  end
end
