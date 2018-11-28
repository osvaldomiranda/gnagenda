class SchedulesController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_schedule, only: [:show, :edit, :update, :destroy, :detail]

  respond_to :html

  def index
    @id_centro = 24
    @tipos = Service.all
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @schedules = Schedule.where(start_time: @date.beginning_of_day..@date.end_of_day).order(:start_time)
    @hoy = 0
    @ayer = 0
    @ultimos7 = 0

    respond_with(@schedules)
  end

  def list
    @service_id = params[:service] || nil

    @service = @service_id.present? ? Service.where(id: @service_id).first.name : nil

    puts "******************"
    puts @service_id
    puts @service
    puts "******************"

    date_last = nil
    date_next = nil

    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @schedules = Schedule.with_service(@service_id)
    respond_with(@schedules)
  end

  def programing
    @events =  Schedule.all.order(:start_time).map{|s| {id: s.id, title: "#{s.first_name} #{s.last_name}", start: s.start_time.strftime('%Y-%m-%d %H:%M:00'), end: s.end_time.strftime('%Y-%m-%d %H:%M:00'), resourceId: s.name}}
  end

  def show
    respond_with(@schedule)
  end

  def detail
    respond_with(@schedule)
  end

  def new
    @id_centro = 24
    @schedules = Schedule.all
    @tipos = Service.all
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today

    @schedule = Schedule.new
    respond_with(@schedule)
  end

  def edit
    @schedules = Schedule.all
    @tipos = Service.all
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def create
    
    @id_centro = 24
    @tipos = Service.all
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @schedules = Schedule.where(start_time: @date.beginning_of_day..@date.end_of_day).order(:start_time)
    @hoy = 0
    @ayer = 0
    @ultimos7 = 0

    puts "****************"
    puts schedule_params[:name]
    puts "****************"

    

    @schedule = Schedule.new(schedule_params)
    @schedule.save
    respond_with(@schedule)
  end

  def update
    @schedule.update(schedule_params)
    respond_with(@schedule)
  end

  def destroy
    @schedule.destroy
    respond_with(@schedule)
  end

  def charge
    ActiveRecord::Base.establish_connection("zdm")
    sql = "SELECT  * FROM agenda "
    array = ActiveRecord::Base.connection.execute(sql).to_a

    ActiveRecord::Base.establish_connection("development")


    array.each do |a| 
      s = Schedule.new
      s.id_centro = a["id_centro"]
      s.rol       = a["rol"]
      s.reservation_id = a["reservation_id"]
      s.status         = a["status"]
      s.creation_time  = DateTime.parse(a["creation_time"])
      s.quantity       = a["quantity"]
      s.start_time     = DateTime.parse(a["start_time"])
      s.end_time       = DateTime.parse(a["end_time"])
      s.user_notes     = a["user_notes"]
      s.custom_color   = a["custom_color"]
      s.night_reservation = a["night_reservation"]
      s.currency       = a["currency"]
      s.first_name     = a["currency"]
      s.last_name      = a["last_name"]
      s.login          = a["login"]
      s.user_id        = a["user_id"] 
      s.email          = a["email"]
      s.mobile_number  = a["mobile_number"]
      s.mobile_country_code = a["mobile_country_code"]
      s.phone          = a["phone"] 
      s.phone_country_code = a["phone_country_code"]
      s.zip            = a["zip"] 
      s.country        = a["country"]
      s.address        = a["address"]
      s.state          = a["state"]
      s.city           = a["city"]
      s.resource_id    = a["resource_id"]
      s.name           = a["name"]
      s.save
    end  



  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:id_centro, :rol, :reservation_id, :status, :creation_time, :quantity, :start_time, :end_time, :user_notes, :custom_color, :night_reservation, :currency, :first_name, :last_name, :login, :user_id, :email, :mobile_number, :mobile_country_code, :phone, :phone_country_code, :zip, :country, :address, :state, :city, :resource_id, :name, :nameresource, :fecha, :hora, :duration, :reminder, :age, :gender, :nationality, :origin, :rut, :service_id, :duration_id)
    
    

    end
end
