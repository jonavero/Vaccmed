
json.data @appointment.each do |a|
  json.listVaccine @detail_appointment =AppointmentDetail.where('"appointment_id"= ?',a.id) do |ad|
    json.id ad.id
    json.vaccineId ad.vaccine.id
    json.name ad.vaccine.name
    json.description ad.vaccine.description
    json.dose ad.vaccine.dose
    json.createDate ad.created_at.strftime("%d-%m-%Y")
    json.status ad.status
    json.minAge ad.vaccine.edadMinima
    json.maxAge ad.vaccine.edadMaxima
  end
end