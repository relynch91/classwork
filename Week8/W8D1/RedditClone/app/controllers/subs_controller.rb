class SubsController < ApplicationController

    before_action :ensure_user_is_moderator!, only: [:edit]
    before_action :require_log_in!, only: [:new, :create]
    
    def new
        @sub = Sub.new
        render :new
    end

    def create 
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id 
        if @sub.save 
            redirect_to subs_url
        else
            flash[:errors] = @sub.errors.full_messages
            render :new  
        end
    end

    def index 
        @subs = Sub.all 
        render :index 
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

    def ensure_user_is_moderator!
        if self.moderator.id == params[:id]
        else 
            flash.now[:errors] = ['Must be moderator to edit']
            redirect_to subs_url
        end
    end
end
