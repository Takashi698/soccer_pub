# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def guest
    user = User.guest_info
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    guest_user = User.admin_guest
    sign_in guest_user   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ログインしました。(管理者ゲスト)'
  end
end

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
# end
