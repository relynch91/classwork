class BlogsController < ApplicationController

    def index 
        @blogs = Blog.all
    end

    def show 
        @blog = Blog.find(self.params[:id])
    end

    def create
        blog = Blog.new(title: params[:blog][:title], body: params[:blog][:body], author_id: params[:blog][:author_id])
        if blog.save
            redirect_to blogs_url
        else
            render json: index
        end
    end

    def destroy
        blog = Blog.find(self.params[:id])
        blog.destroy
        redirect_to blogs_url
    end
end
