json.listTutors @patientTutor do |p|
  json.id p.tutor.id
  json.name p.tutor.name
  json.surname p.tutor.surname
  json.documentType p.tutor.documentType
  json.identityCard p.tutor.identityCard
  json.email p.tutor.email
  json.gender  p.tutor.gender
  json.birthday p.tutor.birthday
  json.phone p.tutor.phone
  json.telephone p.tutor.telephone
  json.workTelephone p.tutor.workTelephone
  json.address p.tutor.address
  json.relationship p.relationship.name

end