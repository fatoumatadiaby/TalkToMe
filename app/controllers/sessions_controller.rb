class SessionsController < ApplicationController

 def new
    @user = User.new
 end
 
 def create
  @user = User.find_by_email(user_params[:email])
      
  if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.user_id
      redirect_to user_profile_path
    else
      render :new
    end 
 end
 
 def destroy
    session.clear
    redirect_to root_path
 end

 private
 def user_params
    params.require(:user_id).permit(:username, :password)
end

 

end