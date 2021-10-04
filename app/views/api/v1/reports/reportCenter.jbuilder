json.reportCenter @report do |r|
  json.center r.branch_office.name
  json.patientName r.patient.name
  json.patientSurname r.patient.surname
  json.patient r.appointmentDate
  json.patient r.created_at.strftime("%d-%m-%Y")

end