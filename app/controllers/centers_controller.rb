class CentersController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @centers = Center.all
    respond_with(@centers)
  end

  def show
    respond_with(@center)
  end

  def new
    @center = Center.new
    respond_with(@center)
  end

  def edit
  end

  def create
    @center = Center.new(center_params)
    @center.save
    respond_with(@center)
  end

  def update
    @center.update(center_params)
    respond_with(@center)
  end

  def destroy
    @center.destroy
    respond_with(@center)
  end

  private
    def set_center
      @center = Center.find(params[:id])
    end

    def center_params
      params.require(:center).permit(:id_centro, :id_propietario, :nombre_centro, :dir_centro, :sector_centro, :comuna_centro, :rut_centro, :web, :email, :telefonos, :anexo, :plan, :status)
    end
end
