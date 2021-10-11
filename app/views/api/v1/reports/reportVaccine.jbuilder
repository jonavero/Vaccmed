#json.totalCount @count
json.reportVaccine @reportVaccine do |r|
  json.name r.name
  json.count r.cantidad
  json.description r.description
  json.dose r.dose
  json.center r.center
  json.appointmentDate r.appointmentDate
  json.status r.status
end