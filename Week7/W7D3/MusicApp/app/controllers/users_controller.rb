class UsersController < ApplicationController
    #       users POST   /users(.:format)       users#create
    #    new_user GET    /users/new(.:format)   users#new
    #        user GET    /users/:id(.:format)   users#show
    def new 
        # @user = User.new
        render :new
    end
    
    def create
        @user = User.new(params[:email])

        if @user.save!
            login_user!(@user)
            redirect_to users_url
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new 
        end

    end

    def show 
         @user = User.find_by(id: :params[:id])
        render json: user 
    end

    private

    # def user_params

    # end
end
