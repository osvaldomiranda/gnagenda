class KinesiologistsController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_kinesiologist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kinesiologists = Kinesiologist.all
    respond_with(@kinesiologists)
  end

  def show
    respond_with(@kinesiologist)
  end

  def new
    @kinesiologist = Kinesiologist.new
    respond_with(@kinesiologist)
  end

  def edit
  end

  def create
    @kinesiologist = Kinesiologist.new(kinesiologist_params)
    @kinesiologist.save
    respond_with(@kinesiologist)
  end

  def update
    @kinesiologist.update(kinesiologist_params)
    respond_with(@kinesiologist)
  end

  def destroy
    @kinesiologist.destroy
    respond_with(@kinesiologist)
  end

  private
    def set_kinesiologist
      @kinesiologist = Kinesiologist.find(params[:id])
    end

    def kinesiologist_params
      params.require(:kinesiologist).permit(:id_centro, :nombre, :hh_mensuales)
    end
end
