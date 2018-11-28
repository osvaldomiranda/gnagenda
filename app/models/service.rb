class Service < ActiveRecord::Base
  has_many :resources


  def self.for_select
    Service.all.order(name: :asc).map {|t| [t.name, t.id]}
  end


  DURATION      = ['Zona Pequeña 15min', 'Zona Mediana 30min','Zona Grande 45min']
  def self.duration_for_select
    #GENDERS.to_enum.with_index(0).to_a
    DURATION.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end 


  REMINDER      = ['15 min', '30 min','1 hora','2 horas', '24 horas']
  def self.reminder_for_select
    #GENDERS.to_enum.with_index(0).to_a
    REMINDER.each.map { |t| [t, t.upcase.gsub(' ', '_')] }
  end

  
  def self.hora_for_select
    #GENDERS.to_enum.with_index(0).to_a
    LookTime.hours_in_day.map{|h| "#{h.strftime("%H:%M")}" }   
  end  
end
