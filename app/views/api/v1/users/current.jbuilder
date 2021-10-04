json.user do
  json.id @current.user.id
  json.username @current.user.username
  json.name @current.names
  json.surname @current.surname
  json.email @current.email
  json.idCenter @current.branch_office.id
  json.nameCenter @current.branch_office.name
  json.role @current.role.description

end