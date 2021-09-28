json.user do
  json.id @current.id
  json.name @current.names
  json.surname @current.surname
  json.email @current.email
  json.nameCenter @current.branch_office.name
  json.role @current.role.description

end