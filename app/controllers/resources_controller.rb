class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find_by(id: params[:id])
  end

  def new
    @resource = Resource.new
    @resource_type = ResourceType.new
  end

  def create
    @resource = Resource.new(resource_params)
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :source_url, :resource_type_id, :car_id)
  end

end
