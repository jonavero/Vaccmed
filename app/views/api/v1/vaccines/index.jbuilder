json.object do
 json.totalCount @count
  json.vaccines @vaccines do |v|
    json.id v.id
    json.name v.name
    json.description v.description
    json.dose v.dose
    json.createDate v.created_at
    json.minimunAge v.edadMinima
    json.maximumAge v.edadMaxima
    json.status v.status
  end

end