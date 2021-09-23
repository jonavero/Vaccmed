json.data do
  json.id @user.id
  json.identityCard @user.identityCard
  json.email @user.email
  json.tutorNames @user.tutor.name
  json.tutorSurname @user.tutor.surname
  json.createdBy @user.createdBy
  json.createDate @user.created_at.strftime("%d-%m-%Y")

end