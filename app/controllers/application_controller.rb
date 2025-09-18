class ApplicationController < ActionController::Base
  before_action :check_profile_completion
  before_action :set_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def check_profile_completion
    
    return if !user_signed_in? || devise_controller?
    
    if current_user.name.blank?
      
      return if controller_name == 'users' && (action_name == 'edit' || action_name == 'update')

      flash[:alert] = "最初にプロフィール情報（名前など）を登録してください。"
      redirect_to edit_user_path(current_user)
      return 
    end

    if current_user.play_model.blank?
      
      return if controller_name == 'users' && action_name == 'registration_complete'
      
      return if controller_name == 'play_models' && ['new', 'create', 'completion'].include?(action_name)

      flash[:alert] = "次にプレイ情報を登録してください。"
      redirect_to new_play_model_path
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
      @received_likes = []
      @likes_count = 0
      @new_matches = []
      @matches_count = 0
    end
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :gender, :age ])
  end
end

