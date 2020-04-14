class PoemsController < ApplicationController
    before_action :require_sign_in!, only: [:index, :new, :create, :edit, :update]
    def index
        @poems = Poem.all
    end

    def new 

    end

    def create 
        @poem = Poem.new(poem_params)
        @poem.author = current_user
        # debugger 
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
        poem = Poem.find(params[:id])

        if current_user.id == poem.user_id
            console.log("i get here")
            poem.update(poem_params)
            # redirect_to new_poem_url
        else 
            flash[:errors] = ["Something went wrong!"]
        end
    end 

    private 

    def poem_params
        params.require(:poem).permit(:title, :stanzas, :complete, :user_id)
    end
end
