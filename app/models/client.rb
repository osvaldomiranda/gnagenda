class Client < ActiveRecord::Base

  scope :with_nombre, -> with_nombre { where("lower(first_name) like ?", '%' + with_nombre + '%') if with_nombre.present?}
  scope :with_apellido, -> with_apellido { where("lower(last_name) like ?", '%' + with_apellido + '%') if with_apellido.present?}
  scope :with_email, -> with_email { where("email like ?", '%' + with_email + '%') if with_email.present?}
  scope :with_reserva, -> with_reserva { where(id: with_reserva ) if with_reserva.present?}

  def schedules
    Schedule.where(rut: self.rut)
  end
 
  STATUS      = ['Clientes con Reserva', 'Ingresados por Admin', 'Verificada']
  def self.status_for_select
    #GENDERS.to_enum.with_index(0).to_a
    STATUS.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end
end
