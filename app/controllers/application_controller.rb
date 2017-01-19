class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  def check_authorization
    Rails.logger.info "#{__FILE__}:#{__LINE__} check_authorization start"
    Rails.logger.debug {"#{__FILE__}:#{__LINE__} header: #{request.headers['Access-Token']}"}
    token = request.headers['Access-Token']
    api_key = ApiKey.find_by_access_token(token)
    Rails.logger.debug {"#{__FILE__}:#{__LINE__} api_key: #{api_key}"}
    if !api_key.present?
      message = I18n.translate :unauthorised_access
      render :json => {:success => false, :message => message}
    else
      @current_user = User.find_by_id(api_key.user_id)
	  session[:current_user] = @current_user
    end
    #head :unauthorized unless api_key
    Rails.logger.info "#{__FILE__}:#{__LINE__} check_authorization end"
  end
    
  def current_user(user_id)
    Rails.logger.debug {"#{__FILE__}:#{__LINE__} $$$$$$$$$$$$$$$$$$ #{session[:user_id]}"}
    @current_user = User.find_by_id(user_id)
    Rails.logger.debug {"#{__FILE__}:#{__LINE__} $$$$$$$$$$$$$$$$$$$########333#{@current_user}"}
  end
  helper_method :current_user
end
