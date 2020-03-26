class ApplicationController < ActionController::Base
    def log_in!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token
    end

    def current_user 
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by[session_token: session[:session_token]]
    end

    def logged_in?
        session[:session_token] == user.session_token
    end

    def log_out!
        @current_user.try(reset_session_token)
        session[:session_token] = nil 
    end
end
