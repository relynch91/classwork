class PoemsController < ApplicationController
    before_action :require_sign_in!, only: [:index, :new, :create, :edit, :update]
    def index
        # @poems = 
    end

    def new 

    end

    def create 
        @poem = Poem.new(poem_params)
        @poem.author = params[:user_id]
        if @poem.save
            redirect_to poems_url
        else 
            flash[:errors] = @poem.errors.full_messages 
            render :new
        end
    end

    def edit

    end

    def update 
        @user 
    end 

    private 

    def poem_params
        params.require(:poem).permit(:title, :stanzas, :complete, :user_id)
    end
end
