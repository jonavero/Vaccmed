json.data do
  json.id @current.id
  json.name @current.names
  json.username @current.surname
  json.email @current.email
  json.nameCenter @current.branch_office.name
  json.role @current.role.description

end