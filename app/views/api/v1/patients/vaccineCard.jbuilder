json.patientName @patient.name
json.patientSurname @patient.surname
json.birthday @patient.birthday
json.listVaccine @appointment.each do |a|
  json.date a.appointmentDate
  json.name a.name
  json.branchOfficeName a.branch_office.name

  if a.nurseName =="none"
    json.nurseName ""
  else
    json.nurseName a.nurseName
  end


end




