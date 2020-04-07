class GoalsController < ApplicationController
    before_action :require_sign_in!, only: [:create, :destroy]
    def create 
        @goal = Goal.new(params.require(:goal).permit(:name, :details, :status))
        @goal.user_id = params[:user_id]
        
        if @goal.save 
            
        else 
            flash[:errors] = @goal.errors.full_messages 
        end
        redirect_to user_url(params[:user_id])
    end

    def destroy
        @goal = current_user.goals.find_by(id: params[:id])
        if @goal && @goal.delete
        end
        redirect_to users_url 
    end
end
