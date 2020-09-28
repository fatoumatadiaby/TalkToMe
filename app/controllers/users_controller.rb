class UsersController < ApplicationController
    #signup
   
    
    def new
        @user = User.new
       
    end
   
    def create
      @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path
        else
            @error = "please fill in all of the information reuired"
            render :new
        end
    end
    
    def show 
        @user = User.find_by_id(params[:id])
        redirect_to user_path
    end
    
    def resources_post_comments
         @resources = current_user.resources
         @posts = current_user.posts
         @comments = current_user.comments
    end
    
    private
     def user_params
        params.require(:user).permit(:username, :password, :name, :email)
     end
end
