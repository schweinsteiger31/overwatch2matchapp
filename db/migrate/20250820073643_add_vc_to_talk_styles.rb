class AddVcToTalkStyles < ActiveRecord::Migration[8.0]
  def change
    add_column :talk_styles, :vc, :integer
  end
end
