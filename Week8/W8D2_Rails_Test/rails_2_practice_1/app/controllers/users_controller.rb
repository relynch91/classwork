class UsersController < ApplicationController
    before_action :require_signed_in!, only: [:show, :index]

    def new 
        @user = User.new 
        render :new 
    end

    def index
        # debugger
        @users = User.all
        render :index 
    end

    def create 
        @user = User.create(params.require(:user).permit(:username, :password))

        if @user.save
            sign_in!(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new 
        end
    end

    def show 
        @user = User.find(params[:id])
        render :show
    end 
end
