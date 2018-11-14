class Center < ActiveRecord::Base
  has_many :resources
  has_many :look_times
  has_many :notifications


  def self.for_select
    OwnerProp.all.order(:email).map{|t| [t.email, User.where(email: t.email).first.id]}
  end 

  def self.for_select(user_id)
    user = User.find(user_id)
    if user.role?('admin')
      Center.all.order(:nombre_centro).map{|t| [t.nombre_centro, t.id_centro]}
    else    
      # owner = Center.where(email: user.email).first
      # centers = OwnerProp.where(id_propietario: owner.id_propietario) 
      # Center.where(id_centro: centers.map{|c| c.id_centro}).map{|t| [t.nombre_centro, t.id_centro]}
      Center.all.order(:nombre_centro).map{|t| [t.nombre_centro, t.id_centro]}
    end  
  end 
end
