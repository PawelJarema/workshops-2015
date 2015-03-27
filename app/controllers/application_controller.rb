class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected
	  def kik_to_login
	    redirect_to new_user_session_path unless user_signed_in? and current_user.admin?
	  end
end
