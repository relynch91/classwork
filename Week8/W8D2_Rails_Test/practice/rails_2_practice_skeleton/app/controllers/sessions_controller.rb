class SessionsController < ApplicationController
    before_action :require_sign_in!, only: [:destroy]
    def new 

    end

    def create 
        # debugger 
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        # debugger 
        if @user 
            sign_in!(@user)
            redirect_to users_url
        else 
            flash[:errors] = ['Invalid username or password']
            render :new 
        end
    end

    def destroy
        sign_out! if signed_in?
        redirect_to new_session_url 
    end
end
