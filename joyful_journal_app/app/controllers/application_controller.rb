class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      last_journal = resource.journals.order(created_at: :desc).first
      if last_journal && last_journal.created_at.to_date == Date.today
        journals_path  # 今日の日記が投稿されている場合は日記一覧ページに遷移
      else
        new_journal_path  # 今日の日記が投稿されていない場合は日記投稿ページに遷移
      end
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation, :name ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
