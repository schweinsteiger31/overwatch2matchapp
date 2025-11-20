class InteractionsController < ApplicationController
  before_action :authenticate_user!

  def create
    match = Match.find(params[:match_id])
    target_user = match.user_one == current_user ? match.user_two : match.user_one

    interaction = InteractionLog.find_or_create_by(user: current_user, target_user: target_user)

    if interaction.persisted?
      if target_user.interacted_with_users.include?(current_user)
        flash[:success] = "相互のプレイが確認されました！#{target_user.name}さんを評価できます。"
      else
        flash[:notice] = "#{target_user.name}さんとのプレイを記録しました。"
      end
    else
      flash[:alert] = "記録に失敗しました。もう一度お試しください。"
    end

    redirect_to user_path(target_user)
  end
end

