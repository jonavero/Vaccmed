json.tutor @tutor.name+' '+@tutor.surname
json.listAppointment @turn do |t|
  json.appointmentId t.id
  json.patientName t.patient.name
  json.patientSurname t.patient.surname
  json.birthday t.patient.birthday
  json.status t.status
  json.dateAppointment t.appointmentDate.strftime("%d-%m-%Y")

end