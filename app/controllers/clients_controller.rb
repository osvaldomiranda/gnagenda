class ClientsController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params["/clients"].present?
      nombre = params["/clients"][:nombre] || nil
      apellido = params["/clients"][:apellido] || nil
      email = params["/clients"][:emol] || nil
      reserva = params["/clients"][:reserva] || nil
    end


    @clients = Client.with_reserva(reserva).with_apellido(apellido).with_nombre(nombre).with_email(email).paginate(:page => params[:page], :per_page => 30)
    respond_with(@clients)
  end

  def show
    respond_with(@client)
  end

  def new
    @client = Client.new
    respond_with(@client)
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.save
    respond_with(@client)
  end

  def update
    @client.update(client_params)
    respond_with(@client)
  end

  def destroy
    @client.destroy
    respond_with(@client)
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:rut, :first_name, :last_name, :email, :celphone, :age, :gender, :citizenship, :origin, :state)
    end
end
