class Schedule < ActiveRecord::Base
  belongs_to :resource

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

end
