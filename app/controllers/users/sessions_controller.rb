# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def destroy
    super do
      respond_to do |format|
        # ヘッダーだけを書き換える
        format.turbo_stream { render turbo_stream: turbo_stream.replace("header", partial: "layouts/header") }
        format.html { redirect_to root_path } # 非Turboリクエスト用
      end
    end
  end
end
