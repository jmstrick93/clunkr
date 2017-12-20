class ResourcesController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:index, :just_added, :show]

  def index
    @resources = Resource.all
  end

  def just_added
    @resources = Resource.just_added
    render 'resources/index'
  end

  def show
    @resource = Resource.find_by(id: params[:id])
    respond_to do |format|
      format.html{render :show}
      format.json{render json: @resource}
    end
  end

  def new
    field_has_content(params[:car_id]) ? @resource = Resource.new(car_id: params[:car_id]) : @resource = Resource.new
    @resource_type = ResourceType.new
  end

  def create
    @resource = Resource.new(resource_params)
    if !@resource.resource_type.valid?
      @resource.resource_type = ResourceType.find_by(id: resource_params[:resource_type_id])
    else
      @resource.resource_type.save
      @resource.resource_type_id = @resource.resource_type.id
    end

    if @resource.save
      success_message(@resource, "create")
      redirect_to resource_path(@resource)
    else
      flash_errors_and_heading(@resource)
      render 'resources/new'
    end
  end

  def edit
    @resource = Resource.find_by(id: params[:id])
  end

  def update
    @resource = Resource.find_by(id: params[:id])
    @resource.update(resource_params)
    if !@resource.resource_type.valid?
      @resource.resource_type = ResourceType.find_by(id: resource_params[:resource_type_id])
    else
      @resource.resource_type.save
      @resource.resource_type_id = @resource.resource_type.id
    end
    if @resource.save
      success_message(@resource, "update")
      redirect_to resource_path(@resource)
    else
      flash_errors_and_heading(@resource)
      render 'resources/edit'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :source_url, :resource_type_id, :car_id, :resource_type_attributes => [:name])
  end

end
