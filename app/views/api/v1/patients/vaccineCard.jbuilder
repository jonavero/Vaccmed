json.patientName @patient.name
json.patientSurname @patient.surname
json.birthday @patient.birthday
json.lisVaccine @appointment.each do |a|
  json.date a.appointmentDate
  json.name a.name
  json.branchOfficeName a.branch_office.name
  json.nurseName a.nurseName


end




