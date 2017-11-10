class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find_by(id: params[:id])
  end
  
end
