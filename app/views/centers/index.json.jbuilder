json.array!(@centers) do |center|
  json.extract! center, :id, :id_centro, :id_propietario, :nombre_centro, :dir_centro, :sector_centro, :comuna_centro, :rut_centro, :web, :email, :telefonos, :anexo, :plan, :status
  json.url center_url(center, format: :json)
end
