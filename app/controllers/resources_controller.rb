class ResourcesController < ApplicationController
   before_action :set_resource, only:[:show, :edit, :update, :destroy]
  
   def index
    @resources = current_user.resources
    if params[:term]
       @resources = Resource.search(params[:term])
     else
       @resources = Resource.all.order("created_at DESC")
     end
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
  
   
  def show
  
  end

  def edit
    if current_user != @resource.user
      redirect_to home_path(current_user)
      end
  end

  # def my_resources
  #   @resources = current_user.resources
  #   redirect_to user_resources_path
  # end

  def update
    set_resource
      if @resource.update(resource_params)
        redirect_to user_resource_path(current_user, @resource)
      else
        render :edit
      end
   end

  def destroy
    current_user
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
