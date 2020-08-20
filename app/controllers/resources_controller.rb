class ResourcesController < ApplicationController


    def index
       
    end

    def new
        @resource = Resource.new
    end

    def create
     if current_user.logged_in?
        @resource = Resource.new(resource_params)
        if @resource.save
            redirect_to #thank you for submitting a resource page
        else
            render :new
        else 
            render :new 
        end
     
    end

    def destroy
        if current_user == @resource.user 
          @resource.destroy
          redirect_to resource_path
        else
            redirect_to 
        end
        

    end
  private
  def resource_params
     params.require(:resource).permit!(
         :disorder,
         :category,
         :resource_link
     )
  end 

  def set_resource
    @resource = Resource.find_by_id(params[:id])
  end
end
