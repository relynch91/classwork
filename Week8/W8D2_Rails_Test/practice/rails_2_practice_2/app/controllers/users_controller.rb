class UsersController < ApplicationController
    before_action :require_sign_in!, only: [:index, :show]
    def new
        @user = User.new
        render :new 
    end

    def create 
        @user = User.create(user_params)

        if @user.save
            # debugger 
            sign_in!(@user)
            redirect_to users_url
        else 
            flash[:errors] = @user.errors.full_messages 
            render :new 
        end
    end

    def index
        if signed_in?
            @users = User.all 
            render :index 
        else 
            redirect_to new_session_url
        end
    end

    def show 
        @user = User.find(params[:id])

    end

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
