class SessionsController < ApplicationController
    
    def new
        @user = User.new
        render :new
    end

    def create
        #verify the user_name/password
        #reset users session token
        #update session hash with new session token
        
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to users_url
        else
            redirect_to new_session_url  #note: redirect_to starts new http request
        end
    end
end

    

end
