class PostsController < ApplicationController
    before_action :ensure_author_id!, only: [:edit, :update]
    before_action :require_log_in!

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit 
        end
    end

     def new
        @user = User.new 
        render :new 
    end

    def create
        @post = Post.new(post_params)
        @post.sub_id = params[:sub_id]
        @post.author_id = current_user.id
        if @post.save
            redirect_to user_post_url
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to user_posts_url
        end
    end

    private

    def ensure_author_id!
        @post = Post.find_by(id: params[:id])
        if @post.author_id == params[:user_id]
        else
            flash.now[:errors] = ['You are not the author.']
            redirect_to subs_url
        end
    end

    def post_params
        params.require(:post).permit(:title, :sub_id)
    end
end
