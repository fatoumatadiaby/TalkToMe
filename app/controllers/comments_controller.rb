class CommentsController < ApplicationController

 def create 
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id 
    if @comment.save
        redirect_to post_path
    else 
    redirect_to post_path, notice: "youre comment could not be saved"
  end
 end

 def destroy
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
 end

 private def comment_params
  params.require(:comment).permit(:body)
 end 
end