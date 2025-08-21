class AddStyleToPlayStyles < ActiveRecord::Migration[8.0]
  def change
    add_column :play_styles, :style, :integer
  end
end
