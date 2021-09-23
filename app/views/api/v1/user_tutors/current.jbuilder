json.data do
  json.id @current_user.id
  json.username @current_user.username
  json.name @current_user.tutor.name
  json.email @current_user.email
  json.role @current_user.tutor.role.description
  #json.nameCenter @current_user.tutor.branch_office.name

end