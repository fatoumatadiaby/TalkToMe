class PostsController < ApplicationController

    def index
        @posts = Post.all 
    end

   
    def show
      set_post
      @comments = Comment.where('post_id = ?', params[:id])
    end

    def new
        @post = Post.new 
    end
    
    def create
        @post = current_user.posts.build(post_params)
    
        if @post.save
          redirect_to user_posts_path(current_user)
        else
          render :new
        end
      end
    
    
    def edit
       set_post
    end

    def update
       set_post
        if @post.update(post_params)
          redirect_to user_post_path(current_user, @post)
        else
          render :edit
        end
      end

    def destroy
     set_post
       @post.destroy
    redirect_to user_posts_path(current_user)
    end

    private
     
    def set_post
        @post = Post.find_by_id(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body, :published_date)
    end
end
