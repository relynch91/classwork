class SessionsController < ApplicationController
    #     session POST   /session(.:format)     sessions#create
    #             DELETE /session(.:format)     sessions#destroy
    # new_session GET    /session/new(.:format) sessions#new

    def create
        # SessionsController create should re-set the appropriate user's 
        # session_token and session[:session_token]
        user = User.find_by_credentials(email, password)
        if user
            session[:session_token] = user.reset_session_token!
            redirect_to :users_url
        else 
            render text "shit"
        end


    end

    def destroy
        session[:session_token] = nil 
    end

    def new
        session[:session_token] = SecureRandom.urlsafe_base64
    end

end
