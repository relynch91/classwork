class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment: params[:comment][:body], comment: params[:comment][:author_id], comment: params[:comment][:blog_id])
    
        if comment.save
            redirect_to comments_url
        else
            render json: index
        end
    end
end
