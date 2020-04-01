class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            sign_in!(@user)
            redirect_to users_url
        else
            flash[:errors] = ["Invalid username or password"]
            render :new
        end
    end

    def destroy
        # debugger 
        sign_out! if signed_in?
        redirect_to new_session_url
    end
end
