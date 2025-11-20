class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :check_profile_completion
  before_action :set_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def check_profile_completion
    return if !user_signed_in? || devise_controller?

    if current_user.name.blank? || current_user.discord_id.blank?
      return if controller_name == 'users' && ['edit', 'update'].include?(action_name)
      
      flash[:alert] = "最初にプロフィール情報（名前・Discord IDなど）を登録してください。"
      redirect_to edit_user_path(current_user)
      return 
    end

    if current_user.play_model.blank?
      return if controller_name == 'users' && action_name == 'registration_complete'
      return if controller_name == 'play_models' && ['new', 'create'].include?(action_name)

      flash[:alert] = "次にプレイ情報を登録してください。"
      redirect_to new_play_model_path
      return 
    end
    
    if current_user.hero_proficiencies.empty?
      return if controller_name == 'hero_proficiencies' && ['edit', 'update'].include?(action_name)

      flash[:alert] = "最後に、ヒーローの習熟度を設定してください。"
      redirect_to edit_hero_proficiency_path
    end
  end

  def set_notifications
    if user_signed_in?
      liked_user_ids = current_user.liked_users.pluck(:id)
      @received_likes = current_user.received_likes.where.not(sender_id: liked_user_ids).order(created_at: :desc).limit(5)
      @likes_count = @received_likes.count
      
      @new_matches = Match.where("user_one_id = ? OR user_two_id = ?", current_user.id, current_user.id).order(created_at: :desc).limit(5)
      @matches_count = @new_matches.count
    else
      @likes_count = 0
      @matches_count = 0
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :gender, :age, :avatar, :discord_id ])
  end
end
