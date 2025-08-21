class AddRoleRanksToPlayModels < ActiveRecord::Migration[8.0]
  def change
    add_column :play_models, :tank_rank_id, :integer
    add_column :play_models, :damage_rank_id, :integer
    add_column :play_models, :support_rank_id, :integer
  end
end
