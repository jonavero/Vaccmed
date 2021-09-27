json.totalCount @count
json.listAppointment @appointments do  |a|
  json.id a.id
  json.patientName a.patient.name
  json.patientSurname a.patient.surname
  json.gender a.patient.gender
  json.status a.status
  json.date a.created_at.strftime("%d-%m-%Y")
  json.createOn a.createdBy
  @vaccines = AppointmentDetail.joins(:vaccine).where('appointment_id=?',a.id)
  json.listvaccine @vaccines do |v|
    json.id v.vaccine.id
    json.name v.vaccine.name
    json.description v.vaccine.description
    json.dose v.vaccine.dose
    json.createdDate v.created_at.strftime("%d-%m-%Y")
    json.status v.status
    json.minAge v.vaccine.edadMinima
    json.maxAge v.vaccine.edadMaxima

  end

end