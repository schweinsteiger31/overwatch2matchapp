class AddCommentToPlayModels < ActiveRecord::Migration[8.0]
  def change
    add_column :play_models, :comment, :text
  end
end
