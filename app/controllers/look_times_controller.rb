class LookTimesController < ApplicationController
  before_action :set_look_time, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @look_times = LookTime.all
    respond_with(@look_times)
  end

  def show
    respond_with(@look_time)
  end

  def new
    @look_time = LookTime.new
    respond_with(@look_time)
  end

  def edit
  end

  def create
    @look_time = LookTime.new(look_time_params)
    @look_time.save
    respond_with(@look_time)
  end

  def update
    @look_time.update(look_time_params)
    respond_with(@look_time)
  end

  def destroy
    @look_time.destroy
    respond_with(@look_time)
  end

  private
    def set_look_time
      @look_time = LookTime.find(params[:id])
    end

    def look_time_params
      params.require(:look_time).permit(:hour, :day, :from, :to, :center_id, :resource_id)
    end
end
