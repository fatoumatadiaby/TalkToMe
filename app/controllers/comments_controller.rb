class CommentsController < ApplicationController

  def create 
    set_post
    set_resource
    
    if @comment = @post.comments.create(params[:comment].permit(:username, :body))
        redirect_to post_path(@post)
    else @comment = @resource.comments.create(params[:comment].permit(:username, :body))
       redirect_to resource_path(@resource)
     end
  end

 def destroy
    set_resource
    set_post
    @comment = @post.comments.find_by_id(params[:id])
    @comment = @resource.comments.find_by_id(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
 end 

 private
  def set_post
   @post = Post.find_by_id(params[:post_id])
  end

  def set_resource
    @resource = Resource.find_by_id(params[:resource_id])
  end
end
