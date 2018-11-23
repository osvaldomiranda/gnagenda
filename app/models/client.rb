class Client < ActiveRecord::Base
  has_many :schedules
  # has_many :notification_schedules

      STATUS      = ['Clientes con Reserva', 'Ingresados por Admin', 'Verificada']
  def self.status_for_select
    #GENDERS.to_enum.with_index(0).to_a
    STATUS.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end
end
