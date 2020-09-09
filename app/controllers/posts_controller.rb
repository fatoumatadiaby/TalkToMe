class PostsController < ApplicationController
  before_action  :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
        @posts = Post.all.order("created_at DESC")
    end

   
    def show
      @comment = @post.comments
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
      
    end

    def update
      if @post.update(post_params)
          redirect_to user_post_path(current_user, @post)
      else
          render :edit
      end
    end

    def destroy
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
