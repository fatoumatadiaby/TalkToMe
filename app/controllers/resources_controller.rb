class ResourcesController < ApplicationController
   def index
      @resources = Resource.all 
  end

 
  def show
    set_resource
  end

  def new
      @resource = Resource.new
  end
  
  def create
      @resource = current_user.resources.build(resource_params)
  
      if @resource.save
        redirect_to resources_path
      else
        render :new
      end
    end
  
  
  def edit
    set_resource
  end

  def update
    set_resource
      if @resource.update(resource_params)
        redirect_to user_post_path(current_user, @post)
      else
        render :edit
      end
    end

  

  
  private
  def resource_params
     params.require(:resource).permit!
  end 

  def set_resource
    @resource = Resource.find_by_id(params[:id])
  end
end
