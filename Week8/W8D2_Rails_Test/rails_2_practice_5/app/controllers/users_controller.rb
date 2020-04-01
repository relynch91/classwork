class UsersController < ApplicationController
    before_action :require_sign_in!, only: [:show, :index]

    def new 
        @user = User.new 
        render :new
    end

    def index 
        @users = User.all 
        render :index 
    end

    def create 
        @user = User.new(user_params)
        # debugger 
        if @user.save 
            sign_in!(@user)
            redirect_to users_url
        else 
            flash[:errors] = @user.errors.full_messages 
            render :new 
        end
    end

    def show
        # debugger 
        @user = User.find(params[:id])
        # debugger 
        render :show
    end

    private 

    def user_params
    params.require(:user).permit(:password, :username)
    end
end
