class UsersController < ApplicationController
    def new 
        @user = User.new 
        render :new 
    end

    def create
        @user = User.create(user_params)
        if @user.save 
            sign_in!(@user)
            # debugger 
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
