class ModifyRanksForEnum < ActiveRecord::Migration[7.0] # Railsのバージョンによって数字は変わります
  def change
    
    remove_column :ranks, :name, :string

    add_column :ranks, :tier, :integer
  end
end