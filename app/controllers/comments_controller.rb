class CommentsController < ApplicationController
  

  def new
    @comment = Comment.new
   
   end



def create 
  
    set_post
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
   if @comment.save
     redirect_to post_comment_path(@post, @comment)
    else
      render :new
    end
   
end

  def show
    set_post
    set_comment
  end
 
def destroy
  
    set_post
    @comment = @post.comments.find(params[:id])
  
    @comment.destroy
    redirect_to post_path(@post)
 end 

 private
 def comment_params
  params.require(:comment).permit(:body)
end 
 
 def set_post
   @post = Post.find_by(params[:post_id])
  end

  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end
 
end
