class SessionsController < ApplicationController

    def new
        @user = User.new
     end

     def welcome
        if session[:user_id]
          @user = User.find(session[:user_id])
       end
     end
     
     def create
        
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
              u.name = auth['info']['name']
              u.email = auth['info']['email']
              u.image = auth['info']['image']
            end
            session[:user_id] = @user.id
            redirect_to root_path
          end
     
     def destroy
        session.clear
        redirect_to root_path
     end
    
     private
     def auth
        request.env['omniauth.auth']
      end

    
     
    
    end