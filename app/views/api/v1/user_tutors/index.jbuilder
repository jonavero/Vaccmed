json.totalUsersTutors @count
json.usersTutors @user_tutors do |ut|
  json.id ut.id
  json.identityCard ut.identityCard
  json.email ut.email
  json.tutorNames ut.tutor.name
  json.tutorSurname ut.tutor.surname

end