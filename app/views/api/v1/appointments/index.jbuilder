json.totalAppointment @count
json.appointments @appointments do |a|
  json.patientName a.patient.name
  json.patientSurname a.patient.surname
  json.patientGender a.patient.gender
  json.tutorfullname a.tutor.name+" "+a.tutor.surname
  json.tutorIdentity a.tutor.identityCard
  json.createOn a.createdBy
  json.status a.created_at.strftime("%d-%m-%Y")

end