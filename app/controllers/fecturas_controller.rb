class FecturasController < ApplicationController
  before_action :set_fectura, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @fecturas = Fectura.all
    respond_with(@fecturas)
  end

  def show
    respond_with(@fectura)
  end

  def new
    @fectura = Fectura.new
    respond_with(@fectura)
  end

  def edit
  end

  def create
    @fectura = Fectura.new(fectura_params)
    @fectura.save
    respond_with(@fectura)
  end

  def update
    @fectura.update(fectura_params)
    respond_with(@fectura)
  end

  def destroy
    @fectura.destroy
    respond_with(@fectura)
  end

  private
    def set_fectura
      @fectura = Fectura.find(params[:id])
    end

    def fectura_params
      params.require(:fectura).permit(:numero, :rut, :destino)
    end
end
