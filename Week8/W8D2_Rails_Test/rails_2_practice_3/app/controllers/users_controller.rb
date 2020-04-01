class UsersController < ApplicationController
    before_action :require_sign_in!, only: [:show, :index]
    def new
        @user = User.new
        render :new 
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            sign_in!(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages 
            render :new 
        end
    end

    def index 
        @users = User.all
        render :index 
    end

    def show 
        @user = User.find(params[:id])
        render :show
        # redirect_to user_url
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
