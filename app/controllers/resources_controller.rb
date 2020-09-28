class ResourcesController < ApplicationController
   before_action :set_resource, only:[:show, :edit, :update, :destroy]
   def index
    if params[:term]
       @resources = Resource.search(params[:term])
 
      else
     
        # @resources = Resource.sort_by_category
        @resources = Resource.all.order("created_at DESC")
     end
    end

 
  def show
  
  end

  def new
   
      @resource = Resource.new 
      
  end
  
  def create
    
    @resource = current_user.resources.build(resource_params)
       if @resource.save
         redirect_to resources_path
       else
        @error = "please fill in all of the information reuired"
         render :new
       end
   end
  
  
  def edit
    set_resource
  end

  def update
    set_resource
      if @resource.update(resource_params)
        redirect_to user_resource_path(current_user, @resource)
      else
        render :edit
      end
   end

  def destroy
    @resource.destroy
    redirect_to user_resources_path(current_user)
   end
  
  private
  def resource_params
     params.require(:resource).permit!
  end 

  def set_resource
    @resource = Resource.find_by_id(params[:id])
  end
end
