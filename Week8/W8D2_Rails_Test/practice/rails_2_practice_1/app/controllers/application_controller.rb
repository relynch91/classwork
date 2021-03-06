class ApplicationController < ActionController::Base
    helper_method :signed_in?, :current_user
    def current_user
        # debugger 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def sign_in!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def sign_out!
        # debugger 
        current_user.reset_session_token!
        session[:session_token] = nil 
    end

    def signed_in?
        # debugger 
        !!current_user
    end

    def require_signed_in! 
        # debugger 
        redirect_to new_session_url unless signed_in?
    end
end
