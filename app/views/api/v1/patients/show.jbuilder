
json.data do

    json.id @patient.id
    json.identityCard @patient.identityCard
    json.name @patient.name
    json.surname @patient.surname
    json.gender @patient.gender
    json.birthday @patient.birthday
    json.createdBy @patient.createdBy
    json.createdDate @patient.created_at.strftime("%d-%m-%Y")

end