class CommentsController < ApplicationController

  def create 

   set_post
      @comment = @post.comments.create(params[:comment].permit(:user_id, :body))
      redirect_to post_path(@post)
   
  end

 def destroy
  
    set_post
    @comment = @post.comments.find_by_id(params[:id])
  
    @comment.destroy
    redirect_to post_path(@post)
 end 

 private
  def set_post
   @post = Post.find(params[:post_id])
  end

  def set_resource
    @resource = Resource.find(params[:resource_id])
  end
end
