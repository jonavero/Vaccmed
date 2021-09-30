json.totalCount @count
json.appointments @appointments do |a|
  json.id a.id
  json.patientId a.patient.id
  json.patientName a.patient.name
  json.patientSurname a.patient.surname
  json.patientGender a.patient.gender
  json.tutorfullname a.tutor.name+" "+a.tutor.surname
  json.tutorIdentity a.tutor.identityCard
  json.createOn a.created_at.strftime("%d-%m-%Y")
  json.status a.status
  json.listVaccine a.appointment_details do |ad|
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
  json.date a.created_at


end