class PostsController < ApplicationController

    def index
        @posts = Post.all 
    end

   
    def new
        @post = Post.new 
        erb :new 
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
end
