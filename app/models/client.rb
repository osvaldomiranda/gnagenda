class Client < ActiveRecord::Base
  def schedules
  	Schedule.where(rut: self.rut)
  end
 
  STATUS      = ['Clientes con Reserva', 'Ingresados por Admin', 'Verificada']
  def self.status_for_select
    #GENDERS.to_enum.with_index(0).to_a
    STATUS.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end
end
