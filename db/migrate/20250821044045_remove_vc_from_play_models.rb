class RemoveVcFromPlayModels < ActiveRecord::Migration[8.0]
  def change
    remove_column :play_models, :vc, :integer
  end
end
