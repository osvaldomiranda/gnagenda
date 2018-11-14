class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.integer :id_centro
      t.integer :id_propietario
      t.text :nombre_centro
      t.string :dir_centro
      t.string :sector_centro
      t.string :comuna_centro
      t.string :rut_centro
      t.string :web
      t.string :email
      t.string :telefonos
      t.string :anexo
      t.string :plan
      t.string :status

      t.timestamps
    end
  end
end
