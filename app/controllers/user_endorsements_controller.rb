class UserEndorsementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_endorsee
  before_action :check_if_interaction_exists
  before_action :check_if_already_endorsed

  def new
    @positive_tags = EndorsementTag.positive
    @negative_tags = EndorsementTag.negative
  end

  def create
    tag_ids = params.dig(:endorsement, :tag_ids)&.reject(&:blank?) || []
    
    if tag_ids.present?
      tag_ids.each do |tag_id|
        current_user.given_endorsements.find_or_create_by(
          endorsee: @endorsee,
          endorsement_tag_id: tag_id
        )
      end
      redirect_to user_path(@endorsee), notice: "#{@endorsee.name}さんを評価しました。"
    else
      flash.now[:alert] = "評価するタグを1つ以上選択してください。"
      @positive_tags = EndorsementTag.positive
      @negative_tags = EndorsementTag.negative
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_endorsee
    @endorsee = User.find(params[:user_id])
  end

  def check_if_interaction_exists
    unless current_user.interacted_with_users.include?(@endorsee) && @endorsee.interacted_with_users.include?(current_user)
      redirect_to user_path(@endorsee), alert: "相互のプレイ記録が確認できないため、まだ評価できません。"
    end
  end
  
  def check_if_already_endorsed
    if current_user.given_endorsements.exists?(endorsee_id: @endorsee.id)
      redirect_to user_path(@endorsee), notice: "このユーザーはすでに評価済みです。"
    end
  end
end

