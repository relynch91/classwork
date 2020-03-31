class UsersController < ApplicationController
    before_action :require_log_in!, only: [:index, :show, :destroy]
    def new 
        @user = User.new
        render :new 
    end

    def index
        @users = User.all 
        render :index 
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show 
        else 
            flash[:errors] = @user.errors.full_messages 
            redirect_to users_url
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy 
        redirect_to users_url 
    end

    def create
        @user = User.new(user_params)
        # debugger
        if @user.save
            log_in(@user)
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
