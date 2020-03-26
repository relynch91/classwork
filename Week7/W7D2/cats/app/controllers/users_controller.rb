class UsersController < ApplicationController
    
    def index
        @users = User.all
        render :index
    end

    def new
        render :new
    end

    def edit
        render text: "We need to work on this"
    end

    def create
        @user = User.new(params.require(:user).permit(:username, :password))

        if @user.save!
            redirect_to users_url
        else
            # puts "we got here"
            # flash.now[:errors] = @user.errors.full_messages
            # render :edit
        end
    end

end
