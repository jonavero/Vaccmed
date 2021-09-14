json.object do
  json.vaccine do
    json.id @vaccine.id
    json.name @vaccine.name
    json.description @vaccine.description
    json.dose @vaccine.dose
    json.typeDose @vaccine.typeDose
    json.minimunAge @vaccine.edadMinima
    json.maximunAge @vaccine.edadMaxima
    json.status @vaccine.status

  end
end