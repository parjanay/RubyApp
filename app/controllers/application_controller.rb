class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find_by(session[:user_id].to_s) if session[:user_id]
            
    end

    def logged_in?
        !!current_user
    end
    
end
