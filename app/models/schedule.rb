class Schedule < ActiveRecord::Base
  belongs_to :resource

  before_save :validate_rut
  after_create :calculate
  validates :first_name, :last_name, :service_id, :email, :mobile_number, :state, :fecha, :hora, :duration_id, presence: true
  
  scope :last_reserv, -> fecha { where(created_at: 3.days.ago..fecha) if fecha.present? }
  scope :next_reserv, -> fecha { where("start_time > ?" , Date.now) if fecha.present? }
  scope :with_service, -> with_service { where(service_id: with_service) if with_service.present?}



  def self.reservado(id_centro, tipo, fecha)
  	Schedule.where(id_centro: id_centro).where(name: tipo).where(start_time: fecha.beginning_of_day..fecha.end_of_day).count > 0
  end

  def self.reservado_hora(id_centro, tipo, fechahora)
  	Schedule.where(id_centro: id_centro).where(name: tipo).where(start_time: fechahora).count > 0
  end

  AGE      = ['15 - 25', '26 - 35','36 - 45','46 - 55', '56-']
  def self.age_for_select
    #GENDERS.to_enum.with_index(0).to_a
    AGE.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

    GENDER      = ['Femenino', 'Masculino']
  def self.gender_for_select
    #GENDERS.to_enum.with_index(0).to_a
    GENDER.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

    ORIGIN      = ['Facebook', 'Instagram','Google','Recomendación', 'Cupon', 'Otro']
  def self.origin_for_select
    #GENDERS.to_enum.with_index(0).to_a
    ORIGIN.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

    MOSTRAR      = ['Resrvaciones registradas', 'LLegada de Clientes']
  def self.mostrar_for_select
    #GENDERS.to_enum.with_index(0).to_a
    MOSTRAR.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

    STATUS      = ['Resrva Confirmada', 'Reserva Registrada', 'Verificada']
  def self.status_for_select
    #GENDERS.to_enum.with_index(0).to_a
    STATUS.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

  LIST = ['Ultmas Resrvas', 'Proximas Reservas', 'Reservas Pendientes']
  def self.list_for_select
    #GENDERS.to_enum.with_index(0).to_a
    LIST.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

  def validate_rut
    value = self.rut
    puts "***************"
    puts self.rut
    puts "***************"
    if value.present?

      value = value.gsub('.','')
      dv=value[value.length-1]

      t=value.to_i
      v=1
      s=0
      for i in (2..9)
        if i == 8
          v=2
        else 
          v+=1
        end
        s+=v*(t%10)
        t/=10
      end

      s = 11 - s%11
      if s == 11
        dvc= '0'
      elsif s == 10
        dvc= 'K'
      else
        dvc=s.to_s
      end

      unless dvc == dv.upcase 
        self.errors[:rut] <<  "Incorrecto"
      end
    else
        self.errors[:rut] << "Run no puede estar en blanco" 
    end    
  end

  def calculate
    unless self.start_time.present?
      self.start_time = DateTime.parse("#{self.fecha} #{self.hora}")
    end
    if self.service_id.present?
      self.name = Service.find(self.service_id).name
    end
    if self.duration_id.present?
      duration = Duration.find(self.duration_id)
      self.duration = duration.name
      unless self.end_time.present?
        self.end_time = self.start_time + (duration.duration*60)
      end
    end
    self.save
    
  end


end
