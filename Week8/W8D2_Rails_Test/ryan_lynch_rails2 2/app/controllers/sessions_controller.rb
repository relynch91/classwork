class SessionsController < ApplicationController
    before_action :require_sign_in!, only: [:destroy]
    def new 
        render :new 
    end

    def create 
        @user = User.find_by_credentials(params[:user][:username], 
            params[:user][:password])
        if @user 
            sign_in!(@user)
            redirect_to users_url
        else 
            flash[:errors] = ["Invalid username or password"]
            render :new 
        end 

    end

    def destroy
        sign_out! if signed_in?
    end
end
