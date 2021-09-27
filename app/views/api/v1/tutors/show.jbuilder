
json.data  do
  json.id @tutor.id
  json.name @tutor.name
  json.surname @tutor.surname
  json.documentType @tutor.documentType
  json.identityCard @tutor.identityCard
  json.email @tutor.email
  json.gender @tutor.gender
  json.birthday @tutor.birthday
  json.phone @tutor.phone
  json.telephone @tutor.telephone
  json.workTelephone @tutor.workTelephone
  json.address @tutor.address
  json.createDate @tutor.created_at.strftime("%d-%m-%Y")
  json.createdBy @tutor.createdBy
end

