
json.appointments  do 
  json.id @appointment.id
  json.patientId @appointment.patient.id
  json.patientName @appointment.patient.name
  json.patientSurname @appointment.patient.surname
  json.patientGender @appointment.patient.gender
  json.tutorfullname @appointment.tutor.name+" "+@appointment.tutor.surname
  json.tutorIdentity @appointment.tutor.identityCard
  json.createOn @appointment.created_at.strftime("%d-%m-%Y")
  json.status @appointment.status

  json.listVaccine @detail_appointment do |ad|
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

  json.date @appointment.created_at.strftime("%d-%m-%Y")


end