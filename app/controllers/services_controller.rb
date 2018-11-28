class ServicesController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @services = Service.all
    respond_with(@services)
  end

  def show
    respond_with(@service)
  end

  def new
    @service = Service.new
    respond_with(@service)
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    @service.save
    respond_with(@service)
  end

  def update
    @service.update(service_params)
    respond_with(@service)
  end

  def destroy
    @service.destroy
    respond_with(@service)
  end

  def duration
    service_id = params[:id]
    @durations = Duration.where(service_id: service_id).map {|a| [a.id, a.name]}

    render json: @durations
  end


  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description)
    end
end
