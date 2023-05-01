class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  #before_actionメソッドは、このコントローラが動作する前に実行される
  #authenticate_userメソッドは、ログイン認証されていなければ、ログイン画面へリダイレクトする
  #exceptは指定したアクションをbefore_actionの対象から外す。今回の場合はtopページのみアクセス可能と
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
