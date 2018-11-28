class DurationsController < ApplicationController
  before_action :set_duration, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @durations = Duration.all
    respond_with(@durations)
  end

  def show
    respond_with(@duration)
  end

  def new
    @duration = Duration.new
    respond_with(@duration)
  end

  def edit
  end

  def create
    @duration = Duration.new(duration_params)
    @duration.save
    respond_with(@duration)
  end

  def update
    @duration.update(duration_params)
    respond_with(@duration)
  end

  def destroy
    @duration.destroy
    respond_with(@duration)
  end

  private
    def set_duration
      @duration = Duration.find(params[:id])
    end

    def duration_params
      params.require(:duration).permit(:name, :duration, :service_id)
    end
end
