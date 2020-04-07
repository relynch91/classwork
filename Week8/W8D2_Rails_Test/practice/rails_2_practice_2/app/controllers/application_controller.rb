class ApplicationController < ActionController::Base

    helper_method :signed_in?, :current_user
    
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def sign_in!(user)
        @current_user = user 
        session[:session_token] = @current_user.reset_session_token!
    end

    def sign_out! 
        current_user.reset_session_token!
        session[:session_token] = nil 
    end

    def signed_in?
        !!current_user
    end

    def require_sign_in!
        if signed_in? 
        else 
            redirect_to new_session_url 
        end
    end
end
