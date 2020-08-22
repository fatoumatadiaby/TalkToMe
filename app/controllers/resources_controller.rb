class ResourcesController < ApplicationController


    def index
       @resources = Resource.all
    end

   def show
     
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
