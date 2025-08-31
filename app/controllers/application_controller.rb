class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # 新規登録後のリダイレクト先
  # def after_sign_up_path_for(resource)
  #   puts "--- after_sign_up_path_forが呼び出されました！ ---"
  #   play_models_edit_path
  # end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    puts "--- ■■■ ログイン後(sign_in)のメソッドが呼び出されました！ ■■■ ---"
    root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :email, :password, :password_confirmation)
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :gender, :age ])

    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :gender, :age ])
  end
end
