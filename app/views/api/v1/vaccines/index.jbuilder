 json.totalCount @count
  json.vaccines @vaccines do |v|
    json.id v.id
    json.name v.name
    json.description v.description
    json.dose v.dose
    json.createDate v.created_at.strftime("%d-%m-%Y")
    json.status v.status
    json.minAge v.edadMinima
    json.maxAge v.edadMaxima
  end

