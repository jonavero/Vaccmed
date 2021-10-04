json.listAppointment @appointments do  |a|
  json.id a.id
json.date a.appointmentDate
json.createOn a.created_at.strftime("%d-%m-%Y")
  @vaccines = AppointmentDetail.joins(:vaccine).where('appointment_id=?',a.id)
  json.listvaccine @vaccines do |v|
    json.name v.vaccine.name
  end
json.tutorName a.tutor.name
  json.surname a.tutor.surname
end