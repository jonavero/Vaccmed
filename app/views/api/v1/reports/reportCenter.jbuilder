json.totalCount @count
json.reportCenter @report do |r|
  json.center r.branch_office.name
  json.patientName r.patient.name
  json.patientSurname r.patient.surname
  json.tutorName r.tutor.name
  json.tutorSurname r.tutor.surname
  json.appointmentDate r.appointmentDate
  json.status r.status
  json.createdAt r.created_at.strftime("%d-%m-%Y")

end