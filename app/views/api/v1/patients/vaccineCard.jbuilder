
json.data @appointment do |a|
  json.patientName a.patient.name
  json.patientSurname a.patient.surname
  json.birthday a.patient.birthday
  json.branchOfficeName a.branch_office.name
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
    json.nurseName ad.nurseName
  end
 end


