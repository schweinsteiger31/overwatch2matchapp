class AddVcToPlayModels < ActiveRecord::Migration[8.0]
  def change
    add_column :play_models, :vc, :integer
  end
end
